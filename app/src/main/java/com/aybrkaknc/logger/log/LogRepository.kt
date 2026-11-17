package com.aybrkaknc.logger.log

import android.content.Context
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.RandomAccessFile

// One displayed log line plus the stack frames ("at ...") folded under it, in file order.
data class RawLog(val line: String, val stack: List<String>)

class LogRepository(context: Context) {
    private val dir: File = context.getExternalFilesDir(null) ?: context.filesDir

    val allFile = File(dir, "logcat-all.txt")
    val filteredFile = File(dir, "filtered-log.txt")

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

    companion object {
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
