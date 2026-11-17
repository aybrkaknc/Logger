package com.aybrkaknc.logger.ui.main

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.aybrkaknc.logger.ui.theme.LoggerColors
import kotlinx.coroutines.delay
import kotlin.math.roundToInt

private class Run(val col: Int, val row: Int, val len: Int, val color: Color)

// Every filled cell uses one color: a solid silhouette.
private fun colorOf(ch: Char): Color? = if (ch == '.') null else LoggerColors.Fg

// Horizontal runs of one color per frame: far fewer draw calls than one rect per cell.
private val RUNS: List<List<Run>> = CatFrames.FRAMES.map { frame ->
    buildList {
        frame.forEachIndexed { row, line ->
            var col = 0
            while (col < line.length) {
                val ch = line[col]
                var end = col
                while (end + 1 < line.length && line[end + 1] == ch) end++
                colorOf(ch)?.let { add(Run(col, row, end - col + 1, it)) }
                col = end + 1
            }
        }
    }
}

// The box is an exact multiple of the cell size, so the drawn cat fills it with no hidden margin.
@Composable
fun SittingCat(height: Dp = 40.dp, modifier: Modifier = Modifier) {
    var step by remember { mutableIntStateOf(0) }
    LaunchedEffect(Unit) {
        while (true) {
            delay(CatFrames.DELAYS_MS[step])
            step = (step + 1) % CatFrames.SEQUENCE.size
        }
    }

    val density = LocalDensity.current
    val cell = with(density) { (height.toPx() / CatFrames.ROWS).roundToInt().coerceAtLeast(1) }
    val boxWidth = with(density) { (cell * CatFrames.COLS).toDp() }
    val boxHeight = with(density) { (cell * CatFrames.ROWS).toDp() }

    Canvas(modifier.size(boxWidth, boxHeight)) {
        // `step` is read here, so only the draw phase reruns.
        val px = cell.toFloat()
        for (run in RUNS[CatFrames.SEQUENCE[step]]) {
            drawRect(run.color, Offset(run.col * px, run.row * px), Size(px * run.len, px))
        }
    }
}
