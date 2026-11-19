package com.aybrkaknc.logger.log

import android.content.Context
import android.net.Uri
import android.provider.DocumentsContract
import android.provider.MediaStore
import androidx.documentfile.provider.DocumentFile
import com.aybrkaknc.logger.settings.Prefs
import java.io.BufferedReader
import java.io.FileInputStream
import java.io.InputStreamReader

// folder: the buffer folder ("main", "all", ...), or "" for files exported by older versions at the top level.
data class LogFileItem(val name: String, val uri: Uri, val modified: Long, val size: Long, val folder: String = "")

// Recorded logs live in <output folder>/<buffer>/ (and <output folder>/all/): the user's chosen
// folder (SAF tree) or Documents/Logs through MediaStore.
object LogFiles {
    private val sessionName = Regex("""^\d{8}-\d{6}(-[a-z]+)?\.txt$""")
    private val legacyPrefixes = listOf("logcat-all-", "filtered-log-")

    fun list(context: Context): List<LogFileItem> {
        val tree = Prefs(context).exportTree
        return if (tree != null) listSaf(context, Uri.parse(tree)) else listMediaStore(context)
    }

    private fun listSaf(context: Context, tree: Uri): List<LogFileItem> {
        val root = DocumentFile.fromTreeUri(context, tree) ?: return emptyList()
        val out = ArrayList<LogFileItem>()
        for (child in root.listFiles()) {
            val name = child.name ?: continue
            if (child.isFile && isLog(name)) {
                out.add(LogFileItem(name, child.uri, child.lastModified(), child.length()))
            } else if (child.isDirectory) {
                for (f in child.listFiles()) {
                    val fn = f.name ?: continue
                    if (f.isFile && isLog(fn)) out.add(LogFileItem(fn, f.uri, f.lastModified(), f.length(), name))
                }
            }
        }
        return out.sortedByDescending { it.modified }
    }

    private fun listMediaStore(context: Context): List<LogFileItem> {
        val projection = arrayOf(
            MediaStore.Files.FileColumns._ID,
            MediaStore.Files.FileColumns.DISPLAY_NAME,
            MediaStore.Files.FileColumns.DATE_MODIFIED,
            MediaStore.Files.FileColumns.SIZE,
            MediaStore.Files.FileColumns.RELATIVE_PATH,
        )
        val selection = "${MediaStore.Files.FileColumns.RELATIVE_PATH} LIKE ?"
        val args = arrayOf("${Prefs.EXPORT_DIR}%")
        val out = ArrayList<LogFileItem>()
        context.contentResolver.query(MediaStore.Files.getContentUri("external"), projection, selection, args, null)?.use { c ->
            while (c.moveToNext()) {
                val name = c.getString(1) ?: continue
                if (!isLog(name)) continue
                val folder = (c.getString(4) ?: "").removePrefix(Prefs.EXPORT_DIR).trim('/')
                val uri = MediaStore.Files.getContentUri("external", c.getLong(0))
                out.add(LogFileItem(name, uri, c.getLong(2) * 1000L, c.getLong(3), folder))
            }
        }
        return out.sortedByDescending { it.modified }
    }

    fun delete(context: Context, item: LogFileItem): Boolean = try {
        if (item.uri.authority == MediaStore.AUTHORITY) {
            context.contentResolver.delete(item.uri, null, null) > 0
        } else {
            DocumentsContract.deleteDocument(context.contentResolver, item.uri)
        }
    } catch (_: Exception) {
        false
    }

    // Newest line first. Files over 1 GB only give their last TAIL_BYTES; the bool reports that.
    fun readNewestFirst(context: Context, item: LogFileItem): Pair<List<String>, Boolean> {
        val pfd = context.contentResolver.openFileDescriptor(item.uri, "r") ?: return emptyList<String>() to false
        pfd.use { p ->
            FileInputStream(p.fileDescriptor).use { fis ->
                val big = item.size > BIG_FILE
                if (big) fis.channel.position(item.size - TAIL_BYTES)
                val lines = BufferedReader(InputStreamReader(fis, Charsets.UTF_8)).readLines()
                val usable = if (big) lines.drop(1) else lines
                return usable.asReversed().filter { it.isNotBlank() } to big
            }
        }
    }

    const val BIG_FILE = 1L shl 30
    const val TAIL_BYTES = 300_000L

    private fun isLog(name: String): Boolean =
        name.endsWith(".txt") && (sessionName.matches(name) || legacyPrefixes.any { name.startsWith(it) })
}
