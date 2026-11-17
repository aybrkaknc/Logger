package com.aybrkaknc.logger.service

import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.ParcelFileDescriptor
import androidx.core.app.ServiceCompat
import androidx.core.content.ContextCompat
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

    @Volatile private var filter: LogFilter? = null
    @Volatile private var binding: ShizukuLogcat.Binding? = null

    private val filterListener = SharedPreferences.OnSharedPreferenceChangeListener { _, _ ->
        filter = LogFilter.from(this, prefs)
    }

    override fun onCreate() {
        super.onCreate()
        prefs = Prefs(this)
        repo = LogRepository(this)
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == ACTION_STOP) stopRecording() else startRecording()
        return START_NOT_STICKY
    }

    private fun startRecording() {
        Notifications.cancelStopped(this)
        val type = if (Build.VERSION.SDK_INT >= 34) ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE else 0
        ServiceCompat.startForeground(this, Notifications.ID_RECORDING, Notifications.recording(this), type)
        if (_running.value) return
        if (!ShizukuLogcat.isGranted()) {
            stopRecording()
            return
        }
        _running.value = true
        filter = LogFilter.from(this, prefs)
        prefs.filterPrefs.registerOnSharedPreferenceChangeListener(filterListener)
        thread(name = "logcat") { readLoop() }
    }

    private fun readLoop() {
        val b = ShizukuLogcat.bind(this)
        if (b == null || !_running.value) {
            b?.let { ShizukuLogcat.unbind(this, it.connection) }
            finishFromWorker()
            return
        }
        binding = b
        try {
            val pfd = b.service.start(ARGS)
            ParcelFileDescriptor.AutoCloseInputStream(pfd).bufferedReader().use { reader ->
                var all = open(repo.allFile)
                var filtered = open(repo.filteredFile)
                try {
                    var count = 0
                    while (_running.value) {
                        val line = reader.readLine() ?: break
                        all.write(line)
                        all.newLine()
                        all.flush()
                        if (filter?.matches(line) == true) {
                            filtered.write(line)
                            filtered.newLine()
                            filtered.flush()
                        }
                        if (++count % 500 == 0) {
                            val max = prefs.maxMb * 1024L * 1024L
                            if (repo.allFile.length() > max) {
                                all.close()
                                LogRepository.trim(repo.allFile, max / 2)
                                all = open(repo.allFile)
                            }
                            if (repo.filteredFile.length() > max) {
                                filtered.close()
                                LogRepository.trim(repo.filteredFile, max / 2)
                                filtered = open(repo.filteredFile)
                            }
                        }
                    }
                } finally {
                    all.close()
                    filtered.close()
                }
            }
        } catch (_: Exception) {
            // Stream closed or Shizuku died; handled below.
        }
        finishFromWorker()
    }

    private fun open(file: File) = BufferedWriter(FileWriter(file, true))

    // logcat ended on its own (not via stop): stop cleanly on the main thread.
    private fun finishFromWorker() {
        if (_running.value) main.post { stopRecording() }
    }

    private fun stopRecording() {
        val wasRunning = _running.value
        _running.value = false
        prefs.filterPrefs.unregisterOnSharedPreferenceChangeListener(filterListener)
        binding?.let {
            try {
                it.service.stop()
            } catch (_: Exception) {
                // Remote already dead.
            }
            ShizukuLogcat.unbind(this, it.connection)
        }
        binding = null
        ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE)
        if (wasRunning) Notifications.showStopped(this)
        stopSelf()
    }

    override fun onDestroy() {
        if (_running.value) stopRecording()
        super.onDestroy()
    }

    companion object {
        const val ACTION_START = "com.aybrkaknc.logger.START"
        const val ACTION_STOP = "com.aybrkaknc.logger.STOP"

        // -T 1: follow only new lines instead of replaying the whole buffer on every start.
        private val ARGS = arrayOf("logcat", "-v", "threadtime", "-v", "uid", "-T", "1", "libc:E", "*:V")

        private val _running = MutableStateFlow(false)
        val running: StateFlow<Boolean> = _running

        fun start(context: Context) = ContextCompat.startForegroundService(
            context, Intent(context, LogService::class.java).setAction(ACTION_START),
        )

        fun stop(context: Context) {
            context.startService(Intent(context, LogService::class.java).setAction(ACTION_STOP))
        }
    }
}
