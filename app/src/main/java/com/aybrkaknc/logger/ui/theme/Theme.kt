package com.aybrkaknc.logger.ui.theme

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Typography
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R

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
