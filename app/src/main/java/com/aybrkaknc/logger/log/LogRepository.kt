package com.aybrkaknc.logger.log

import android.content.Context
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.RandomAccessFile
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

// One displayed log line plus the stack frames ("at ...") folded under it, in file order.
data class RawLog(val line: String, val stack: List<String>)

class LogRepository(context: Context) {
    private val dir: File = context.getExternalFilesDir(null) ?: context.filesDir

    // One file per buffer and recording, named by start time. Filters only change what is shown.
    val rawDir = File(dir, "raw-log").apply { mkdirs() }

    fun newSessionBase(): String = SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(Date())

    // The newest session's file of a buffer for the live screen.
    fun liveFile(buffer: String = "main"): File? =
        rawDir.listFiles()?.filter { matchesBuffer(it.name, buffer) }?.maxByOrNull { it.name }

    // Live files of the given buffers, only those of the newest session.
    fun liveFiles(buffers: List<String>): Map<String, File> {
        val all = buffers.mapNotNull { b -> liveFile(b)?.let { b to it } }
        val latest = all.maxOfOrNull { it.second.name.take(15) } ?: return emptyMap()
        return all.filter { it.second.name.startsWith(latest) }.toMap()
    }

    // Newest first across several buffers, merged by timestamp. The crash buffer repeats lines of main, so equal lines collapse.
    fun recentLinesAll(files: Map<String, File>, filter: LogFilter, offsets: Map<String, Long>, limit: Int = 200): List<RawLog> =
        files.flatMap { (b, f) -> recentLines(f, filter, offsets[b] ?: 0L, limit) }
            .distinctBy { it.line }
            .sortedByDescending { it.line.take(18) }
            .take(limit)

    // Newest first. Reads only the tail of the file to keep refreshes cheap.
    // minOffset hides everything written before it (used by "clear screen"); it always sits on a line boundary.
    fun recentLines(
        file: File,
        filter: LogFilter,
        minOffset: Long = 0,
        limit: Int = 200,
        tailBytes: Long = 300_000,
    ): List<RawLog> {
        if (!file.exists()) return emptyList()
        val text = RandomAccessFile(file, "r").use { raf ->
            val start = maxOf(minOffset, raf.length() - tailBytes)
            if (start >= raf.length()) return emptyList()
            raf.seek(start)
            val buf = ByteArray((raf.length() - start).toInt())
            raf.readFully(buf)
            Pair(String(buf, Charsets.UTF_8), start > minOffset)
        }
        val lines = text.first.split('\n')
        val from = if (text.second) 1 else 0 // first line may be cut in half
        val out = ArrayList<RawLog>(limit)
        // Walking newest to oldest, stack frames show up before the error line they belong to.
        val frames = ArrayList<String>()
        for (i in lines.lastIndex downTo from) {
            val line = lines[i]
            if (line.isBlank() || LogLine.hidden(line)) continue
            if (LogLine.isStackFrame(line)) {
                frames.add(line.substring(line.indexOf("\tat ") + 1))
                continue
            }
            if (filter.matches(line)) {
                out.add(RawLog(line, frames.reversed()))
                if (out.size >= limit) break
            }
            frames.clear()
        }
        return out
    }

    private fun matchesBuffer(name: String, buffer: String): Boolean =
        name.endsWith("-$buffer.txt") || (buffer == "main" && name.matches(Regex("""^\d{8}-\d{6}\.txt$""")))

    companion object {
        fun fileName(base: String, buffer: String) = "$base-$buffer.txt"

        // Keeps roughly the newest `keep` bytes, starting at a line boundary.
        fun trim(file: File, keep: Long) {
            val tmp = File(file.path + ".tmp")
            RandomAccessFile(file, "r").use { raf ->
                val start = maxOf(0L, raf.length() - keep)
                raf.seek(start)
                if (start > 0) {
                    while (true) {
                        val b = raf.read()
                        if (b == -1 || b == '\n'.code) break
                    }
                }
                FileOutputStream(tmp).use { out ->
                    val buf = ByteArray(64 * 1024)
                    while (true) {
                        val n = raf.read(buf)
                        if (n < 0) break
                        out.write(buf, 0, n)
                    }
                }
            }
            if (!file.delete() || !tmp.renameTo(file)) throw IOException("trim failed")
        }
    }
}
