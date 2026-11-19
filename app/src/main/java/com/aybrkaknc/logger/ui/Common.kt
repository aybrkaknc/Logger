package com.aybrkaknc.logger.ui

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.draw.drawWithContent
import androidx.compose.ui.graphics.drawscope.withTransform
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import com.aybrkaknc.logger.ui.theme.TitleStyle
import kotlinx.coroutines.delay
import kotlin.random.Random

@Composable
// Press feedback: the button shrinks slightly and flashes solid green with a black icon while held.
fun IconBtn(@DrawableRes icon: Int, @StringRes desc: Int, onClick: () -> Unit, tint: Color = LoggerColors.Fg) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    val scale by animateFloatAsState(if (pressed) 0.85f else 1f, tween(if (pressed) 80 else 120), label = "iconPress")
    Box(
        Modifier.size(44.dp)
            .graphicsLayer { scaleX = scale; scaleY = scale }
            .background(if (pressed) LoggerColors.Fg else Color.Transparent, RoundedCornerShape(10.dp))
            .clickable(interactionSource = interaction, indication = null, onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        Icon(
            painterResource(icon),
            stringResource(desc),
            tint = if (pressed) LoggerColors.Bg else tint,
            modifier = Modifier.size(24.dp),
        )
    }
}

@Composable
fun ScreenHeader(title: String, onBack: () -> Unit, action: (@Composable () -> Unit)? = null) {
    Row(
        Modifier.fillMaxWidth().statusBarsPadding()
            .padding(horizontal = 8.dp, vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        IconBtn(R.drawable.ic_back, R.string.action_back, onBack)
        Spacer(Modifier.width(8.dp))
        Title(title)
        Spacer(Modifier.weight(1f))
        action?.invoke()
    }
}

// Screen tearing: while tear is non-zero, a few horizontal bands of the content slide sideways.
fun Modifier.tearing(tear: Int): Modifier = drawWithContent {
    if (tear == 0) {
        drawContent()
    } else {
        val rnd = Random(tear)
        repeat(4) {
            val top = rnd.nextFloat() * size.height
            val bandHeight = 2.dp.toPx() + rnd.nextFloat() * size.height * 0.2f
            val dx = rnd.nextInt(-6, 7).dp.toPx()
            withTransform({
                clipRect(0f, top, size.width, top + bandHeight)
                translate(dx, 0f)
            }) {
                this@drawWithContent.drawContent()
            }
        }
    }
}

// Terminal-style glitch: now and then the title tears and red and cyan copies shift out to the sides.
@Composable
private fun Title(title: String) {
    var titleSize by remember(title) { mutableStateOf(TitleStyle.fontSize) }
    var shift by remember { mutableIntStateOf(0) }
    var tear by remember { mutableIntStateOf(0) }
    LaunchedEffect(Unit) {
        while (true) {
            delay(Random.nextLong(2500, 5000))
            repeat(3) {
                shift = Random.nextInt(1, 4)
                tear = Random.nextInt(1, Int.MAX_VALUE)
                delay(60)
            }
            shift = 0
            tear = 0
        }
    }
    val style = TitleStyle.copy(fontSize = titleSize)
    Box {
        if (shift > 0) {
            Text(title, style = style.copy(color = LoggerColors.Red), maxLines = 1, softWrap = false, modifier = Modifier.offset(x = (-shift).dp))
            Text(title, style = style.copy(color = LoggerColors.Cyan), maxLines = 1, softWrap = false, modifier = Modifier.offset(x = shift.dp))
        }
        Text(
            title,
            style = style,
            maxLines = 1,
            softWrap = false,
            modifier = Modifier.tearing(tear),
            // Shrinks the title step by step until it fits the row on one line.
            onTextLayout = { if (it.hasVisualOverflow && titleSize > 12.sp) titleSize *= 0.9f },
        )
    }
}

// Green glow that breathes between 0 and 1; faster while recording.
@Composable
fun pulseGlow(running: Boolean): Float {
    val transition = rememberInfiniteTransition(label = "recordPulse")
    return transition.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(tween(if (running) 350 else 900), RepeatMode.Reverse),
        label = "recordGlow",
    ).value
}

// Eight thin rounded layers stack up toward the element: green near the edge, fading to transparent outward.
fun Modifier.recordGlow(glow: Float, corner: Dp): Modifier = drawBehind {
    for (i in 8 downTo 1) {
        val pad = i * 0.75f * density
        drawRoundRect(
            color = LoggerColors.Fg.copy(alpha = 0.09f * glow),
            topLeft = Offset(-pad, -pad),
            size = Size(size.width + 2 * pad, size.height + 2 * pad),
            cornerRadius = CornerRadius(corner.toPx() + pad),
        )
    }
}

@Composable
fun LoggerField(value: String, onValueChange: (String) -> Unit, hint: String, modifier: Modifier = Modifier) {
    BasicTextField(
        value = value,
        onValueChange = onValueChange,
        singleLine = true,
        textStyle = TextStyle(fontFamily = JetBrainsMono, color = LoggerColors.Fg, fontSize = 14.sp),
        cursorBrush = SolidColor(LoggerColors.Fg),
        modifier = modifier.fillMaxWidth(),
        decorationBox = { inner ->
            Box(
                Modifier.fillMaxWidth()
                    .background(LoggerColors.Field, RoundedCornerShape(8.dp))
                    .border(1.dp, LoggerColors.Fg, RoundedCornerShape(8.dp))
                    .padding(horizontal = 12.dp, vertical = 10.dp),
            ) {
                if (value.isEmpty()) Text(hint, color = LoggerColors.Hint, fontFamily = JetBrainsMono, fontSize = 14.sp)
                inner()
            }
        },
    )
}
