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
        // The buffer list is frozen for the whole recording.
        val base = repo.newSessionBase()
        val buffers = (Prefs.CORE_BUFFERS + prefs.buffers).distinct()
        sessionBase = base
        sessionBuffers = buffers
        worker = thread(name = "logcat") { readAll(base, buffers) }
    }

    // Copies what has been recorded so far to the output folder under a new timestamp; recording goes on.
    private fun saveSnapshot() {
        val source = sessionBase
        val buffers = sessionBuffers
        val target = repo.newSessionBase()
        thread(name = "logcat-save") {
            val msg = if (exportSession(source, target, buffers) == 0) {
                getString(R.string.save_empty)
            } else {
                getString(R.string.save_done, target, (prefs.exportName ?: Prefs.EXPORT_DIR).trim('/'))
            }
            main.post { Toast.makeText(this, msg, Toast.LENGTH_LONG).show() }
        }
    }

    // Copies one session's files to <output folder>/<buffer>/<target>.txt, and the all-buffer file to
    // <output folder>/all/<target>.txt. Returns how many files were copied.
    private fun exportSession(source: String, target: String, buffers: List<String>): Int =
        (buffers + ALL).count { buf ->
            ExportManager.copyToOutput(this, File(repo.rawDir, LogRepository.fileName(source, buf)), buf, "$target.txt")
        }

    // One logcat process and one reader thread per buffer, plus one process reading all of them together
    // (the ALL file). Files are always raw and unfiltered: raw-log/<base>-<buffer>.txt and raw-log/<base>-all.txt.
    private fun readAll(base: String, buffers: List<String>) {
        val b = ShizukuLogcat.bind(this)
        if (b == null || !_running.value) {
            b?.let { ShizukuLogcat.unbind(this, it.connection) }
        } else {
            binding = b
            val streams = buffers.map { buf -> thread(name = "logcat-$buf") { readStream(b, argsFor(buf), base, buf, alerts = true) } } +
                thread(name = "logcat-$ALL") { readStream(b, argsFor(buffers.joinToString(",")), base, ALL, alerts = false) }
            streams.forEach { it.join() }
        }
        _running.value = false
        // Recording is over: copy the finished files into the output folder once, not live.
        exportSession(base, base, buffers)
        main.post { finalizeStop(recorded = true) }
    }

    private fun readStream(b: ShizukuLogcat.Binding, args: Array<String>, base: String, name: String, alerts: Boolean) {
        val file = File(repo.rawDir, LogRepository.fileName(base, name))
        try {
            val pfd = b.service.start(args)
            ParcelFileDescriptor.AutoCloseInputStream(pfd).bufferedReader().use { reader ->
                var raw: BufferedWriter? = null
                try {
                    var count = 0
                    while (_running.value) {
                        val line = reader.readLine() ?: break
                        if (alerts && prefs.crashAlert && (line.contains("FATAL EXCEPTION") || line.contains("ANR in"))) {
                            Notifications.crash(this, line)
                        }
                        // Files are created on the first line, so a silent buffer leaves no empty file.
                        val out = raw ?: open(file).also { raw = it }
                        out.write(line)
                        out.newLine()
                        out.flush()
                        if (++count % 500 == 0) {
                            val max = prefs.maxMb * 1024L * 1024L
                            if (file.length() > max) {
                                raw?.close()
                                LogRepository.trim(file, max / 2)
                                raw = open(file)
                            }
                        }
                    }
                } finally {
                    raw?.close()
                }
            }
        } catch (_: Exception) {
            // This stream closed or was refused; the others keep going.
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
        private const val ALL = "all"

        // -T 1: follow only new lines instead of replaying the whole buffer on every start.
        private fun argsFor(buffer: String) =
            arrayOf("logcat", "-v", "threadtime", "-v", "uid", "-T", "1", "-b", buffer, "*:V")

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
