package com.aybrkaknc.logger.export

import android.content.ContentValues
import android.content.Context
import android.net.Uri
import android.provider.DocumentsContract
import android.provider.MediaStore
import com.aybrkaknc.logger.settings.Prefs
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

object ExportManager {
    const val PREFIX_ALL = "logcat-all-"
    const val PREFIX_FILTERED = "filtered-log-"

    // Blocking; call off the main thread. Returns the shown destination path, or null on failure.
    fun export(context: Context, source: File, prefix: String): String? {
        if (!source.exists()) return null
        val prefs = Prefs(context)
        val name = prefix + SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(Date()) + ".txt"
        val resolver = context.contentResolver
        return try {
            val tree = prefs.exportTree
            val (uri, shown) = if (tree != null) {
                val treeUri = Uri.parse(tree)
                val parent = DocumentsContract.buildDocumentUriUsingTree(treeUri, DocumentsContract.getTreeDocumentId(treeUri))
                DocumentsContract.createDocument(resolver, parent, "text/plain", name) to "${prefs.exportName ?: ""}/$name"
            } else {
                val values = ContentValues().apply {
                    put(MediaStore.MediaColumns.DISPLAY_NAME, name)
                    put(MediaStore.MediaColumns.MIME_TYPE, "text/plain")
                    put(MediaStore.MediaColumns.RELATIVE_PATH, Prefs.EXPORT_DIR)
                }
                resolver.insert(MediaStore.Files.getContentUri("external"), values) to "${Prefs.EXPORT_DIR}/$name"
            }
            if (uri == null) return null
            val out = resolver.openOutputStream(uri) ?: return null
            out.use { o -> source.inputStream().use { it.copyTo(o) } }
            shown
        } catch (_: Exception) {
            null
        }
    }
}
