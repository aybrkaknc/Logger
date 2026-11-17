package com.aybrkaknc.logger.service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import com.aybrkaknc.logger.MainActivity
import com.aybrkaknc.logger.R

object Notifications {
    const val ID_RECORDING = 1
    const val ID_STOPPED = 2
    const val ID_CRASH = 3
    private const val CHANNEL_CRASH = "crash"
    private const val CHANNEL = "recording"

    private fun manager(context: Context) = context.getSystemService(NotificationManager::class.java)

    private fun ensureChannel(context: Context) {
        manager(context).createNotificationChannel(
            NotificationChannel(CHANNEL, context.getString(R.string.notif_channel), NotificationManager.IMPORTANCE_LOW),
        )
    }

    private fun openApp(context: Context) = PendingIntent.getActivity(
        context, 0,
        Intent(context, MainActivity::class.java).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP),
        PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
    )

    fun recording(context: Context): Notification {
        ensureChannel(context)
        val stop = PendingIntent.getService(
            context, 1,
            Intent(context, LogService::class.java).setAction(LogService.ACTION_STOP),
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        return Notification.Builder(context, CHANNEL)
            .setSmallIcon(R.drawable.ic_play)
            .setContentTitle(context.getString(R.string.notif_title))
            .setContentText(context.getString(R.string.notif_text))
            .setContentIntent(openApp(context))
            .setOngoing(true)
            .addAction(Notification.Action.Builder(null, context.getString(R.string.notif_action_stop), stop).build())
            .build()
    }

    fun showStopped(context: Context) {
        ensureChannel(context)
        val resume = PendingIntent.getForegroundService(
            context, 2,
            Intent(context, LogService::class.java).setAction(LogService.ACTION_START),
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        val n = Notification.Builder(context, CHANNEL)
            .setSmallIcon(R.drawable.ic_stop)
            .setContentTitle(context.getString(R.string.notif_title))
            .setContentText(context.getString(R.string.notif_stopped))
            .setContentIntent(openApp(context))
            .addAction(Notification.Action.Builder(null, context.getString(R.string.notif_action_resume), resume).build())
            .build()
        manager(context).notify(ID_STOPPED, n)
    }

    fun cancelStopped(context: Context) = manager(context).cancel(ID_STOPPED)

    // High-priority alert for FATAL EXCEPTION / ANR lines; tapping opens the app.
    fun crash(context: Context, line: String) {
        manager(context).createNotificationChannel(
            NotificationChannel(CHANNEL_CRASH, context.getString(R.string.notif_crash_channel), NotificationManager.IMPORTANCE_HIGH),
        )
        val n = Notification.Builder(context, CHANNEL_CRASH)
            .setSmallIcon(R.drawable.ic_stop)
            .setContentTitle(context.getString(R.string.notif_crash_title))
            .setContentText(line.takeLast(200))
            .setStyle(Notification.BigTextStyle().bigText(line))
            .setContentIntent(openApp(context))
            .setAutoCancel(true)
            .build()
        manager(context).notify(ID_CRASH, n)
    }
}
