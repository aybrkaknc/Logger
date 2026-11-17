package com.aybrkaknc.logger.service

import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.ParcelFileDescriptor
import android.widget.Toast
import com.aybrkaknc.logger.R
import androidx.core.app.ServiceCompat
import androidx.core.content.ContextCompat
import com.aybrkaknc.logger.export.ExportManager
import com.aybrkaknc.logger.log.LogFilter
import com.aybrkaknc.logger.log.LogRepository
import com.aybrkaknc.logger.settings.Prefs
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import java.io.BufferedWriter
import java.io.File
import java.io.FileWriter
import kotlin.concurrent.thread

class LogService : Service() {
    private val main = Handler(Looper.getMainLooper())
    private lateinit var prefs: Prefs
    private lateinit var repo: LogRepository

    @Volatile private var binding: ShizukuLogcat.Binding? = null
    @Volatile private var worker: Thread? = null
    @Volatile private var sessionBase = ""
    @Volatile private var sessionFilter: LogFilter? = null
    @Volatile private var sessionBuffers: List<String> = emptyList()

    override fun onCreate() {
        super.onCreate()
        prefs = Prefs(this)
        repo = LogRepository(this)
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_STOP -> stopRecording()
            ACTION_SAVE -> if (_running.value) saveSnapshot() else stopSelf()
            else -> startRecording()
        }
        return START_NOT_STICKY
    }

    private fun startRecording() {
        Notifications.cancelStopped(this)
        val type = if (Build.VERSION.SDK_INT >= 34) ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE else 0
        ServiceCompat.startForeground(this, Notifications.ID_RECORDING, Notifications.recording(this), type)
        if (_running.value) return
        if (!ShizukuLogcat.isGranted()) {
            finalizeStop(recorded = false)
            return
        }
        _running.value = true
        // The filter and the buffer list are frozen for the whole recording.
        val filter = LogFilter.from(this, prefs)
        val base = repo.newSessionBase()
        val buffers = (Prefs.CORE_BUFFERS + prefs.buffers).distinct()
        sessionBase = base
        sessionFilter = filter
        sessionBuffers = buffers
        worker = thread(name = "logcat") { readAll(filter, base, buffers) }
    }

    // Copies what has been recorded so far to the output folder under a new timestamp; recording goes on.
    private fun saveSnapshot() {
        val filter = sessionFilter ?: return
        val buffers = sessionBuffers
        val snapshot = repo.newSessionBase()
        thread(name = "logcat-save") {
            val saved = mutableListOf<String>()
            for (buf in buffers) {
                val source = LogRepository.fileName(sessionBase, buf)
                val target = LogRepository.fileName(snapshot, buf)
                if (ExportManager.copyToOutput(this, File(repo.rawDir, source), "raw-log", target)) saved.add(target)
                if (filter.isActive) ExportManager.copyToOutput(this, File(repo.filteredDir, source), "filtered-log", target)
            }
            val msg = if (saved.isEmpty()) {
                getString(R.string.save_empty)
            } else {
                val others = saved.drop(1).map { it.substringAfterLast('-').removeSuffix(".txt") }
                val name = saved.first() + if (others.isEmpty()) "" else " (${others.joinToString(", ")})"
                val folder = (prefs.exportName ?: Prefs.EXPORT_DIR).trim('/') + "/raw-log"
                getString(R.string.save_done, name, folder)
            }
            main.post { Toast.makeText(this, msg, Toast.LENGTH_LONG).show() }
        }
    }

    // One logcat process and one reader thread per buffer; each buffer writes its own files:
    // raw-log/<base>-<buffer>.txt always, filtered-log/<base>-<buffer>.txt when a filter is active.
    private fun readAll(filter: LogFilter, base: String, buffers: List<String>) {
        val b = ShizukuLogcat.bind(this)
        if (b == null || !_running.value) {
            b?.let { ShizukuLogcat.unbind(this, it.connection) }
        } else {
            binding = b
            buffers.map { buf -> thread(name = "logcat-$buf") { readBuffer(b, buf, filter, base) } }
                .forEach { it.join() }
        }
        _running.value = false
        // Recording is over: copy the finished files into the output folder once, not live.
        for (buf in buffers) {
            val name = LogRepository.fileName(base, buf)
            ExportManager.copyToOutput(this, File(repo.rawDir, name), "raw-log", name)
            if (filter.isActive) ExportManager.copyToOutput(this, File(repo.filteredDir, name), "filtered-log", name)
        }
        main.post { finalizeStop(recorded = true) }
    }

    private fun readBuffer(b: ShizukuLogcat.Binding, buffer: String, filter: LogFilter, base: String) {
        val name = LogRepository.fileName(base, buffer)
        val rawFile = File(repo.rawDir, name)
        val filteredFile = if (filter.isActive) File(repo.filteredDir, name) else null
        try {
            val pfd = b.service.start(argsFor(buffer))
            ParcelFileDescriptor.AutoCloseInputStream(pfd).bufferedReader().use { reader ->
                var raw: BufferedWriter? = null
                var filtered: BufferedWriter? = null
                try {
                    var count = 0
                    while (_running.value) {
                        val line = reader.readLine() ?: break
                        if (prefs.crashAlert && (line.contains("FATAL EXCEPTION") || line.contains("ANR in"))) {
                            Notifications.crash(this, line)
                        }
                        // Files are created on the first line, so a silent buffer leaves no empty file.
                        val rawOut = raw ?: open(rawFile).also { raw = it }
                        rawOut.write(line)
                        rawOut.newLine()
                        rawOut.flush()
                        if (filteredFile != null && filter.matches(line)) {
                            val filteredOut = filtered ?: open(filteredFile).also { filtered = it }
                            filteredOut.write(line)
                            filteredOut.newLine()
                            filteredOut.flush()
                        }
                        if (++count % 500 == 0) {
                            val max = prefs.maxMb * 1024L * 1024L
                            if (rawFile.length() > max) {
                                raw?.close()
                                LogRepository.trim(rawFile, max / 2)
                                raw = open(rawFile)
                            }
                            if (filteredFile != null && filtered != null && filteredFile.length() > max) {
                                filtered?.close()
                                LogRepository.trim(filteredFile, max / 2)
                                filtered = open(filteredFile)
                            }
                        }
                    }
                } finally {
                    raw?.close()
                    filtered?.close()
                }
            }
        } catch (_: Exception) {
            // This buffer's stream closed or was refused; the others keep going.
        }
    }

    private fun open(file: File) = BufferedWriter(FileWriter(file, true))

    private fun stopRecording() {
        _running.value = false
        binding?.let {
            try {
                it.service.stop()
            } catch (_: Exception) {
                // Remote already dead.
            }
            ShizukuLogcat.unbind(this, it.connection)
        }
        binding = null
        // The worker copies the files and then calls finalizeStop; with no worker, finish now.
        if (worker?.isAlive != true) finalizeStop(recorded = false)
    }

    private fun finalizeStop(recorded: Boolean) {
        if (_running.value) return // a new recording already started
        ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE)
        if (recorded) Notifications.showStopped(this)
        stopSelf()
    }

    override fun onDestroy() {
        if (_running.value) stopRecording()
        super.onDestroy()
    }

    companion object {
        const val ACTION_START = "com.aybrkaknc.logger.START"
        const val ACTION_STOP = "com.aybrkaknc.logger.STOP"
        const val ACTION_SAVE = "com.aybrkaknc.logger.SAVE"

        // -T 1: follow only new lines instead of replaying the whole buffer on every start.
        private fun argsFor(buffer: String) =
            arrayOf("logcat", "-v", "threadtime", "-v", "uid", "-T", "1", "-b", buffer, "libc:E", "*:V")

        private val _running = MutableStateFlow(false)
        val running: StateFlow<Boolean> = _running

        fun start(context: Context) = ContextCompat.startForegroundService(
            context, Intent(context, LogService::class.java).setAction(ACTION_START),
        )

        fun save(context: Context) {
            context.startService(Intent(context, LogService::class.java).setAction(ACTION_SAVE))
        }

        fun stop(context: Context) {
            context.startService(Intent(context, LogService::class.java).setAction(ACTION_STOP))
        }
    }
}
