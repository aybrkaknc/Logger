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
    val tags: Set<String> = emptySet(),
    val pids: Set<Int> = emptySet(),
) {
    val isActive get() =
        packages.isNotEmpty() || levels != LogLine.ALL || text.isNotEmpty() || tags.isNotEmpty() || pids.isNotEmpty()

    val key get() = "$packages|$levels|$text|$tags|$pids"

    fun matches(line: String): Boolean {
        if (packages.isNotEmpty() && LogLine.uid(line) !in uids && packages.none { line.contains(it) }) return false
        if (LogLine.levelBit(LogLine.level(line)) and levels == 0 && !LogLine.alwaysShown(line)) return false
        if (tags.isNotEmpty() && LogLine.tag(line).lowercase(Locale.ROOT) !in tags) return false
        if (pids.isNotEmpty() && LogLine.pid(line) !in pids) return false
        if (text.isNotEmpty() && !line.lowercase(Locale.ROOT).contains(text)) return false
        return true
    }

    companion object {
        // "ActivityManager, Finsky" -> {"activitymanager", "finsky"}
        fun splitList(raw: String): List<String> = raw.split(',').map { it.trim() }.filter { it.isNotEmpty() }

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
            return LogFilter(
                packages = packages,
                levels = prefs.levels,
                text = prefs.text.trim().lowercase(Locale.ROOT),
                uids = uids,
                tags = splitList(prefs.tags).map { it.lowercase(Locale.ROOT) }.toSet(),
                pids = splitList(prefs.pids).mapNotNull { it.toIntOrNull() }.toSet(),
            )
        }
    }
}
