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
    val levelColor: Color,
    val app: String,
    @param:StringRes val explain: Int?,
    val stack: List<String> = emptyList(),
    val appColor: Color = LoggerColors.Fg,
)

// Same app always gets the same hue, so its rows are easy to follow while scanning.
private val appPalette = listOf(LoggerColors.Fg, LoggerColors.Cyan, LoggerColors.AppPurple, LoggerColors.AppOrange)

fun appColorFor(app: String): Color = appPalette[Math.floorMod(app.hashCode(), appPalette.size)]

class LogDescriber(private val context: Context) {
    private val names = ConcurrentHashMap<Int, String>()

    fun describe(raw: RawLog): LogEntry = describe(raw.line).copy(stack = raw.stack)

    fun describe(line: String): LogEntry {
        val level = LogLine.level(line)
        val (label, color) = when {
            level == "E" || level == "F" -> R.string.lvl_error to LoggerColors.Red
            level == "W" || line.contains("died") -> R.string.lvl_warn to LoggerColors.Yellow
            level == "D" -> R.string.lvl_debug to LoggerColors.Cyan
            level == "V" -> R.string.lvl_verbose to LoggerColors.Gray
            else -> R.string.lvl_info to LoggerColors.Fg
        }
        val explain = PATTERNS.firstOrNull { line.contains(it.first) }?.second
        val app = appName(line)
        return LogEntry(line, LogLine.time(line), label, color, app, explain, appColor = appColorFor(app))
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
