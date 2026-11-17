package com.aybrkaknc.logger.export

import android.content.ContentValues
import android.content.Context
import android.net.Uri
import android.provider.MediaStore
import androidx.documentfile.provider.DocumentFile
import com.aybrkaknc.logger.settings.Prefs
import java.io.File

object ExportManager {
    // Copies a finished session file into <output folder>/<subdir>/<name>: the chosen SAF folder, or
    // Documents/Logs when none is chosen. Blocking; call off the main thread. Returns true on success.
    fun copyToOutput(context: Context, source: File, subdir: String, name: String): Boolean {
        if (!source.exists() || source.length() == 0L) return false
        val resolver = context.contentResolver
        return try {
            val tree = Prefs(context).exportTree
            val uri: Uri? = if (tree != null) {
                val root = DocumentFile.fromTreeUri(context, Uri.parse(tree))
                val dir = root?.findFile(subdir) ?: root?.createDirectory(subdir)
                dir?.createFile("text/plain", name)?.uri
            } else {
                val values = ContentValues().apply {
                    put(MediaStore.MediaColumns.DISPLAY_NAME, name)
                    put(MediaStore.MediaColumns.MIME_TYPE, "text/plain")
                    put(MediaStore.MediaColumns.RELATIVE_PATH, "${Prefs.EXPORT_DIR}/$subdir")
                }
                resolver.insert(MediaStore.Files.getContentUri("external"), values)
            }
            val out = uri?.let { resolver.openOutputStream(it) } ?: return false
            out.use { o -> source.inputStream().use { it.copyTo(o) } }
            true
        } catch (_: Exception) {
            false
        }
    }
}
