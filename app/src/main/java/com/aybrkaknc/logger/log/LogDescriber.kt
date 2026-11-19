package com.aybrkaknc.logger.log

import android.content.Context
import android.content.pm.PackageManager
import androidx.annotation.StringRes
import androidx.compose.ui.graphics.Color
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.ui.theme.LoggerColors
import java.util.concurrent.ConcurrentHashMap

data class LogEntry(
    val raw: String,
    val time: String,
    @param:StringRes val levelLabel: Int,
    // Fixed English name for the side bar; it does not change with the app language.
    val badge: String,
    val levelColor: Color,
    val app: String,
    @param:StringRes val explain: Int?,
    val stack: List<String> = emptyList(),
    val appColor: Color = LoggerColors.Fg,
)

// Same app always gets the same hue, so its rows are easy to follow while scanning.
private val appPalette = listOf(LoggerColors.Cyan, LoggerColors.AppPurple, LoggerColors.AppOrange)

fun appColorFor(app: String): Color = appPalette[Math.floorMod(app.hashCode(), appPalette.size)]

class LogDescriber(private val context: Context) {
    private val names = ConcurrentHashMap<Int, String>()

    fun describe(raw: RawLog): LogEntry = describe(raw.line).copy(stack = raw.stack)

    fun describe(line: String): LogEntry {
        val level = LogLine.level(line)
        val (label, badge, color) = when {
            level == "E" || level == "F" -> Triple(R.string.lvl_error, "ERROR", LoggerColors.Red)
            level == "W" || line.contains("died") -> Triple(R.string.lvl_warn, "WARNING", LoggerColors.Yellow)
            level == "D" -> Triple(R.string.lvl_debug, "DEBUG", LoggerColors.Cyan)
            level == "V" -> Triple(R.string.lvl_verbose, "VERBOSE", LoggerColors.Gray)
            else -> Triple(R.string.lvl_info, "INFO", LoggerColors.Fg)
        }
        val explain = PATTERNS.firstOrNull { line.contains(it.first) }?.second
        val app = appName(line)
        return LogEntry(line, LogLine.time(line), label, badge, color, app, explain, appColor = appColorFor(app))
    }

    private fun appName(line: String): String {
        val uid = LogLine.uid(line)
        if (uid < 0) return fallbackName(line)
        return names.getOrPut(uid) { resolve(uid, line) }
    }

    private fun resolve(uid: Int, line: String): String {
        val pm = context.packageManager
        val pkg = pm.getPackagesForUid(uid)?.firstOrNull() ?: return fallbackName(line)
        return try {
            pm.getApplicationLabel(pm.getApplicationInfo(pkg, 0)).toString()
        } catch (_: PackageManager.NameNotFoundException) {
            pkg
        }
    }

    private fun fallbackName(line: String): String = when {
        line.contains("com.google.android.gms") -> context.getString(R.string.app_gms)
        line.contains("com.android.vending") -> context.getString(R.string.app_vending)
        else -> ""
    }

    companion object {
        private val PATTERNS = listOf(
            "FATAL EXCEPTION" to R.string.explain_crash,
            "ANR in" to R.string.explain_anr,
            "SQLITE_READONLY_DBMOVED" to R.string.explain_db,
            "has died" to R.string.explain_died,
        )
    }
}
