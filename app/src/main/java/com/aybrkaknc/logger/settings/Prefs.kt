package com.aybrkaknc.logger.settings

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit
import com.aybrkaknc.logger.log.LogLine

class Prefs(context: Context) {
    private val settings = context.getSharedPreferences("settings", Context.MODE_PRIVATE)
    val filterPrefs: SharedPreferences = context.getSharedPreferences("filter", Context.MODE_PRIVATE)

    var maxMb: Int
        get() = settings.getInt(KEY_MAX_MB, DEFAULT_MAX_MB)
        set(v) = settings.edit { putInt(KEY_MAX_MB, v) }

    var fontSp: Int
        get() = settings.getInt(KEY_FONT_SP, DEFAULT_FONT_SP).coerceIn(FONT_MIN, FONT_MAX)
        set(v) = settings.edit { putInt(KEY_FONT_SP, v.coerceIn(FONT_MIN, FONT_MAX)) }

    var exportTree: String?
        get() = settings.getString(KEY_EXPORT_TREE, null)
        set(v) = settings.edit { putString(KEY_EXPORT_TREE, v) }

    var exportName: String?
        get() = settings.getString(KEY_EXPORT_NAME, null)
        set(v) = settings.edit { putString(KEY_EXPORT_NAME, v) }

    var packages: Set<String>
        get() = filterPrefs.getStringSet(KEY_PACKAGES, DEFAULT_PACKAGES)?.toSet() ?: DEFAULT_PACKAGES
        set(v) = filterPrefs.edit { putStringSet(KEY_PACKAGES, v) }

    var levels: Int
        get() = filterPrefs.getInt(KEY_LEVELS, DEFAULT_LEVELS)
        set(v) = filterPrefs.edit { putInt(KEY_LEVELS, v) }

    var text: String
        get() = filterPrefs.getString(KEY_TEXT, "") ?: ""
        set(v) = filterPrefs.edit { putString(KEY_TEXT, v) }

    var showSystem: Boolean
        get() = filterPrefs.getBoolean(KEY_SYSTEM, false)
        set(v) = filterPrefs.edit { putBoolean(KEY_SYSTEM, v) }

    companion object {
        const val KEY_MAX_MB = "max_mb"
        const val KEY_FONT_SP = "font_sp"
        const val KEY_EXPORT_TREE = "export_tree"
        const val KEY_EXPORT_NAME = "export_name"
        const val KEY_PACKAGES = "packages"
        const val KEY_LEVELS = "levels"
        const val KEY_TEXT = "text"
        const val KEY_SYSTEM = "system"

        const val DEFAULT_MAX_MB = 1024
        const val DEFAULT_FONT_SP = 14
        const val FONT_MIN = 8
        const val FONT_MAX = 20
        // Unfiltered by default: every level, every app.
        const val DEFAULT_LEVELS = LogLine.ALL
        const val EXPORT_DIR = "Documents/Logs"
        val DEFAULT_PACKAGES = emptySet<String>()
    }
}
