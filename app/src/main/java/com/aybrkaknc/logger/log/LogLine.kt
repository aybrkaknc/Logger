package com.aybrkaknc.logger.log

// Parses lines produced by `logcat -v threadtime -v uid`:
// MM-DD HH:MM:SS.mmm  UID  PID  TID L TAG: message
object LogLine {
    const val ERROR = 1
    const val WARN = 2
    const val INFO = 4
    const val ALL = ERROR or WARN or INFO

    private val whitespace = Regex("\\s+")

    fun fields(line: String): List<String> = line.trim().split(whitespace, limit = 7)

    private fun isLevel(s: String) = s.length == 1 && "VDIWEF".contains(s)

    fun level(line: String): String {
        val f = fields(line)
        if (f.size > 5 && isLevel(f[5])) return f[5]
        if (f.size > 4 && isLevel(f[4])) return f[4]
        return ""
    }

    fun uid(line: String): Int {
        val f = fields(line)
        return if (f.size > 5 && isLevel(f[5])) f[2].toIntOrNull() ?: -1 else -1
    }

    fun levelBit(level: String): Int = when (level) {
        "E", "F" -> ERROR
        "W" -> WARN
        else -> INFO
    }

    // Crashes, ANRs and process deaths pass the level filter regardless of level.
    fun alwaysShown(line: String) =
        line.contains("FATAL EXCEPTION") || line.contains("ANR in") || line.contains("died")

    // Stack frames and noisy task queries are kept in files but not shown.
    fun hidden(line: String) = line.contains("\tat ") || line.contains("getRecentTasks")

    fun time(line: String): String = if (line.length >= 14) line.substring(6, 14) else ""
}
