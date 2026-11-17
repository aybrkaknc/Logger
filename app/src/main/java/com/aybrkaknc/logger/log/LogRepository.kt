package com.aybrkaknc.logger.log

import android.content.Context
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.RandomAccessFile

class LogRepository(context: Context) {
    private val dir: File = context.getExternalFilesDir(null) ?: context.filesDir

    val allFile = File(dir, "logcat-all.txt")
    val filteredFile = File(dir, "filtered-log.txt")

    // Newest first. Reads only the tail of the file to keep refreshes cheap.
    fun recentLines(file: File, filter: LogFilter, limit: Int = 200, tailBytes: Long = 300_000): List<String> {
        if (!file.exists()) return emptyList()
        val text = RandomAccessFile(file, "r").use { raf ->
            val start = maxOf(0L, raf.length() - tailBytes)
            raf.seek(start)
            val buf = ByteArray((raf.length() - start).toInt())
            raf.readFully(buf)
            Pair(String(buf, Charsets.UTF_8), start > 0)
        }
        val lines = text.first.split('\n')
        val from = if (text.second) 1 else 0 // first line may be cut in half
        val out = ArrayList<String>(limit)
        for (i in lines.lastIndex downTo from) {
            val line = lines[i]
            if (line.isBlank() || LogLine.hidden(line) || !filter.matches(line)) continue
            out.add(line)
            if (out.size >= limit) break
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
