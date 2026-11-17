package com.aybrkaknc.logger.ui.theme

import androidx.compose.foundation.layout.offset
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Typography
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Outline
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.unit.Density
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.LayoutDirection
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import kotlin.math.roundToInt

object LoggerColors {
    val Bg = Color(0xFF000000)
    val Fg = Color(0xFF33FF33)
    val Dim = Color(0xFF1F8F1F)
    val Red = Color(0xFFFF4444)
    val Yellow = Color(0xFFFFD700)
    val Selected = Color(0xFF1A5C1A)
    val Panel = Color(0xFF0A0A0A)
    val Field = Color(0xFF141414)
    val Hint = Color(0xFF2A9A2A)
    val Label = Color(0xFFE0E0E0)
    val Divider = Color(0xFF222222)
    val White = Color(0xFFFFFFFF)
}

val PixelTitle = FontFamily(Font(R.font.pixel_operator_mono_hb8))

val JetBrainsMono = FontFamily(
    Font(R.font.jetbrains_mono_regular, FontWeight.Normal),
    Font(R.font.jetbrains_mono_bold, FontWeight.Bold),
)

val TitleStyle = TextStyle(fontFamily = PixelTitle, fontSize = 24.sp, color = LoggerColors.Fg)

// Rectangle with square-cut corners: a pixel-art frame instead of a rounded card.
class PixelCutShape(private val cut: Dp) : Shape {
    override fun createOutline(size: Size, layoutDirection: LayoutDirection, density: Density): Outline {
        val c = with(density) { cut.toPx() }
        val path = Path().apply {
            moveTo(c, 0f)
            lineTo(size.width - c, 0f)
            lineTo(size.width, c)
            lineTo(size.width, size.height - c)
            lineTo(size.width - c, size.height)
            lineTo(c, size.height)
            lineTo(0f, size.height - c)
            lineTo(0f, c)
            close()
        }
        return Outline.Generic(path)
    }
}

// Pixel Operator Mono: capitals span 0..700 above the baseline, the line box spans -100..700 (800 units).
// The letters therefore sit 50/800 em above the box center; push the text down to center them.
fun Modifier.centerCaps(): Modifier =
    offset { IntOffset(0, (TitleStyle.fontSize.toPx() * 50f / 800f).roundToInt()) }

private val colors = darkColorScheme(
    primary = LoggerColors.Fg,
    onPrimary = LoggerColors.Panel,
    secondary = LoggerColors.Dim,
    background = LoggerColors.Bg,
    onBackground = LoggerColors.Fg,
    surface = LoggerColors.Panel,
    onSurface = LoggerColors.Fg,
    error = LoggerColors.Red,
)

private val base = Typography()

private val typography = Typography(
    bodyLarge = base.bodyLarge.copy(fontFamily = JetBrainsMono),
    bodyMedium = base.bodyMedium.copy(fontFamily = JetBrainsMono),
    bodySmall = base.bodySmall.copy(fontFamily = JetBrainsMono),
    labelLarge = base.labelLarge.copy(fontFamily = JetBrainsMono),
    labelMedium = base.labelMedium.copy(fontFamily = JetBrainsMono),
    labelSmall = base.labelSmall.copy(fontFamily = JetBrainsMono),
    titleMedium = base.titleMedium.copy(fontFamily = JetBrainsMono),
)

@Composable
fun LoggerTheme(content: @Composable () -> Unit) {
    MaterialTheme(colorScheme = colors, typography = typography, content = content)
}
