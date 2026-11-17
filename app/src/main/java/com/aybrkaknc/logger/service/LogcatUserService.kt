package com.aybrkaknc.logger.service

import android.os.ParcelFileDescriptor
import java.io.IOException
import kotlin.system.exitProcess

// Runs inside the Shizuku (shell) process, which is allowed to read every app's logs.
// logcat output is streamed back to the app through a pipe.
class LogcatUserService : ILogcatService.Stub() {
    private val processes = mutableListOf<Process>()

    override fun start(args: Array<String>): ParcelFileDescriptor {
        val p = ProcessBuilder(*args).redirectErrorStream(true).start()
        synchronized(processes) { processes.add(p) }
        val pipe = ParcelFileDescriptor.createPipe()
        Thread {
            try {
                ParcelFileDescriptor.AutoCloseOutputStream(pipe[1]).use { out -> p.inputStream.copyTo(out) }
            } catch (_: IOException) {
                // Reader side closed; nothing to do.
            } finally {
                p.destroy()
            }
        }.start()
        return pipe[0]
    }

    // Stops every logcat process started through start().
    override fun stop() {
        synchronized(processes) {
            processes.forEach { it.destroy() }
            processes.clear()
        }
    }

    override fun destroy() {
        stop()
        exitProcess(0)
    }
}
