package com.aybrkaknc.logger.ui.main

import androidx.compose.animation.core.FastOutSlowInEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.TransformOrigin
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.unit.dp
import com.aybrkaknc.logger.ui.theme.LoggerColors

// Pixel cat on a 26x26 grid: sits facing the viewer, only the tail layer moves.
private const val GRID = 26f

private val tail = listOf(
    floatArrayOf(20f, 10f, 3f, 3f), floatArrayOf(22f, 13f, 3f, 3f),
    floatArrayOf(22f, 16f, 3f, 3f), floatArrayOf(20f, 19f, 3f, 3f),
)
private val body = listOf(
    floatArrayOf(6f, 2f, 3f, 3f), floatArrayOf(15f, 2f, 3f, 3f), // ears
    floatArrayOf(6f, 5f, 12f, 9f), // head
    floatArrayOf(5f, 14f, 14f, 9f), // body
    floatArrayOf(7f, 22f, 3f, 2f), floatArrayOf(14f, 22f, 3f, 2f), // paws
)
private val face = listOf(
    floatArrayOf(8f, 8f, 2f, 2f), floatArrayOf(14f, 8f, 2f, 2f), // eyes
    floatArrayOf(11f, 11f, 2f, 1f), // mouth
)

private fun DrawScope.pixels(rects: List<FloatArray>, color: Color) {
    val s = size.width / GRID
    for (r in rects) drawRect(color, Offset(r[0] * s, r[1] * s), Size(r[2] * s, r[3] * s))
}

@Composable
fun SittingCat(modifier: Modifier = Modifier.size(36.dp)) {
    val transition = rememberInfiniteTransition(label = "tail")
    val angle = transition.animateFloat(
        initialValue = -18f,
        targetValue = 18f,
        animationSpec = infiniteRepeatable(tween(700, easing = FastOutSlowInEasing), RepeatMode.Reverse),
        label = "angle",
    )
    Box(modifier) {
        // Reading the angle inside graphicsLayer only re-draws this layer, no recomposition.
        Canvas(
            Modifier.matchParentSize().graphicsLayer {
                rotationZ = angle.value
                transformOrigin = TransformOrigin(20f / GRID, 22f / GRID)
            },
        ) { pixels(tail, LoggerColors.Fg) }
        Canvas(Modifier.matchParentSize()) {
            pixels(body, LoggerColors.Fg)
            pixels(face, LoggerColors.Bg)
        }
    }
}
