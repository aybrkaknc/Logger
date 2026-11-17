package com.aybrkaknc.logger.service

import android.content.ComponentName
import android.content.Context
import android.content.ServiceConnection
import android.content.pm.PackageManager
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import rikka.shizuku.Shizuku
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

object ShizukuLogcat {
    const val PERMISSION_REQUEST = 1

    fun isRunning(): Boolean = try {
        Shizuku.pingBinder()
    } catch (_: Throwable) {
        false
    }

    fun isGranted(): Boolean =
        isRunning() && !Shizuku.isPreV11() && Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED

    private fun args(context: Context) = Shizuku.UserServiceArgs(
        ComponentName(context.packageName, LogcatUserService::class.java.name),
    ).daemon(false).processNameSuffix("logcat").version(1)

    class Binding(val service: ILogcatService, val connection: ServiceConnection)

    // Blocks the calling worker thread until the user service is connected. Never call on the main thread.
    fun bind(context: Context, timeoutMs: Long = 10_000): Binding? {
        val latch = CountDownLatch(1)
        var service: ILogcatService? = null
        val connection = object : ServiceConnection {
            override fun onServiceConnected(name: ComponentName?, binder: IBinder?) {
                if (binder != null && binder.pingBinder()) service = ILogcatService.Stub.asInterface(binder)
                latch.countDown()
            }

            override fun onServiceDisconnected(name: ComponentName?) = Unit
        }
        Handler(Looper.getMainLooper()).post {
            try {
                Shizuku.bindUserService(args(context), connection)
            } catch (_: Throwable) {
                latch.countDown()
            }
        }
        if (!latch.await(timeoutMs, TimeUnit.MILLISECONDS)) return null
        return service?.let { Binding(it, connection) }
    }

    fun unbind(context: Context, connection: ServiceConnection) {
        try {
            Shizuku.unbindUserService(args(context), connection, true)
        } catch (_: Throwable) {
            // Shizuku already gone.
        }
    }
}
