package com.aybrkaknc.logger.log

import android.content.Context
import android.content.pm.PackageManager
import com.aybrkaknc.logger.settings.Prefs
import java.util.Locale

class LogFilter(
    val packages: Set<String>,
    val levels: Int,
    val text: String,
    private val uids: Set<Int>,
) {
    val isActive get() = packages.isNotEmpty() || levels != LogLine.ALL || text.isNotEmpty()

    val key get() = "$packages|$levels|$text"

    fun matches(line: String): Boolean {
        if (packages.isNotEmpty() && LogLine.uid(line) !in uids && packages.none { line.contains(it) }) return false
        if (LogLine.levelBit(LogLine.level(line)) and levels == 0 && !LogLine.alwaysShown(line)) return false
        if (text.isNotEmpty() && !line.lowercase(Locale.ROOT).contains(text)) return false
        return true
    }

    companion object {
        fun from(context: Context, prefs: Prefs = Prefs(context)): LogFilter {
            val packages = prefs.packages
            val pm = context.packageManager
            val uids = packages.mapNotNull { pkg ->
                try {
                    pm.getApplicationInfo(pkg, 0).uid
                } catch (_: PackageManager.NameNotFoundException) {
                    null
                }
            }.toSet()
            return LogFilter(packages, prefs.levels, prefs.text.trim().lowercase(Locale.ROOT), uids)
        }
    }
}
