package com.aybrkaknc.logger.ui.main

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.widget.Toast
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.layout.onSizeChanged
import kotlin.math.roundToInt
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.selection.SelectionContainer
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.lerp
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.window.Popup
import androidx.compose.ui.window.PopupProperties
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.log.LogEntry
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import com.aybrkaknc.logger.ui.theme.PixelCutShape
import kotlinx.coroutines.delay

@Composable
fun LogRow(
    entry: LogEntry,
    fontSp: Int,
    query: String,
    current: Boolean,
    modifier: Modifier = Modifier,
    selected: Boolean = false,
    selectionMode: Boolean = false,
    onToggleSelect: () -> Unit = {},
    onStartSelect: () -> Unit = {},
) {
    val context = LocalContext.current
    val density = LocalDensity.current
    var pressed by remember { mutableStateOf(false) }
    var menu by remember { mutableStateOf(false) }
    var pressAt by remember { mutableStateOf(Offset.Zero) }
    var rowWidth by remember { mutableIntStateOf(0) }
    var selectDialog by remember { mutableStateOf(false) }
    var stackOpen by remember { mutableStateOf(false) }
    val toggle by rememberUpdatedState(onToggleSelect)
    val sel by animateFloatAsState(if (pressed || menu || selected) 1f else 0f, tween(220), label = "sel")

    val header = buildString {
        append(entry.time).append(" - ").append(stringResource(entry.levelLabel))
        if (entry.app.isNotEmpty()) append(" - ").append(entry.app)
    }
    val explain = entry.explain?.let { stringResource(it) }

    Box(modifier.fillMaxWidth().padding(bottom = 12.dp).onSizeChanged { rowWidth = it.width }) {
        Column(Modifier.fillMaxWidth()) {
            Text(
                text = describe(header, explain, entry, sel, fontSp, query, current),
                fontFamily = JetBrainsMono,
                fontSize = fontSp.sp,
                modifier = Modifier.fillMaxWidth()
                    .background(lerp(Color.Transparent, LoggerColors.Hint, sel), RoundedCornerShape(4.dp))
                    .pointerInput(entry.raw, selectionMode) {
                        if (selectionMode) {
                            // In selection mode a tap or long-press only toggles this row.
                            detectTapGestures(onTap = { toggle() }, onLongPress = { toggle() })
                        } else {
                            detectTapGestures(
                                onPress = {
                                    pressed = true
                                    tryAwaitRelease()
                                    delay(150)
                                    pressed = false
                                },
                                onLongPress = { pressAt = it; menu = true },
                            )
                        }
                    }
                    .padding(horizontal = 4.dp, vertical = 2.dp),
            )
            if (entry.stack.isNotEmpty()) {
                Text(
                    stringResource(if (stackOpen) R.string.stack_open else R.string.stack_closed, entry.stack.size),
                    color = LoggerColors.Dim,
                    fontFamily = JetBrainsMono,
                    fontSize = (fontSp * 0.8f).sp,
                    modifier = Modifier.clickable { stackOpen = !stackOpen }.padding(horizontal = 4.dp, vertical = 4.dp),
                )
                if (stackOpen) {
                    Text(
                        entry.stack.joinToString("\n"),
                        color = LoggerColors.Dim,
                        fontFamily = JetBrainsMono,
                        fontSize = (fontSp * 0.75f).sp,
                        modifier = Modifier.padding(start = 16.dp, end = 4.dp),
                    )
                }
            }
        }
        if (menu) {
            // Own popup instead of DropdownMenu: its built-in vertical padding left black bars above and below the items.
            // Opens at the long-press point, kept inside the row horizontally.
            val menuWidth = with(density) { 200.dp.roundToPx() }
            val x = pressAt.x.roundToInt().coerceIn(0, maxOf(0, rowWidth - menuWidth))
            Popup(
                alignment = Alignment.TopStart,
                offset = IntOffset(x, pressAt.y.roundToInt()),
                onDismissRequest = { menu = false },
                properties = PopupProperties(focusable = true),
            ) {
                val shape = PixelCutShape(4.dp)
                Column(
                    Modifier.width(200.dp)
                        .clip(shape)
                        .background(LoggerColors.Panel, shape)
                        .border(1.dp, LoggerColors.Dim, shape),
                ) {
                    MenuItem(R.string.copy_entry) { menu = false; copy(context, entry.raw) }
                    MenuItemDivider()
                    MenuItem(R.string.select_mode) { menu = false; onStartSelect() }
                    MenuItemDivider()
                    MenuItem(R.string.select_text) { menu = false; selectDialog = true }
                    MenuItemDivider()
                    MenuItem(R.string.share_title) { menu = false; share(context, entry.raw) }
                }
            }
        }
    }

    if (selectDialog) {
        val plain = listOfNotNull(header, explain, entry.raw).joinToString("\n")
        AlertDialog(
            onDismissRequest = { selectDialog = false },
            containerColor = LoggerColors.Panel,
            confirmButton = {
                TextButton(onClick = { selectDialog = false }) { Text(stringResource(R.string.close), color = LoggerColors.Fg) }
            },
            text = {
                SelectionContainer(Modifier.verticalScroll(rememberScrollState())) {
                    Text(plain, color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontSize = fontSp.sp)
                }
            },
        )
    }
}

// Pressed item inverts: solid green bar with black text, no ripple.
@Composable
private fun MenuItem(label: Int, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Box(
        Modifier.fillMaxWidth()
            .background(if (pressed) LoggerColors.Fg else LoggerColors.Panel)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 16.dp, vertical = 10.dp),
    ) {
        Text(
            stringResource(label),
            color = if (pressed) LoggerColors.Bg else LoggerColors.Fg,
            fontFamily = JetBrainsMono,
            fontSize = 13.sp,
        )
    }
}

@Composable
private fun MenuItemDivider() {
    Box(Modifier.fillMaxWidth().height(1.dp).background(LoggerColors.Dim))
}

// Marks every case-insensitive occurrence of query; offsets come from the original text, so they stay valid.
private fun AnnotatedString.Builder.appendMarked(text: String, query: String, mark: Color) {
    if (query.isEmpty()) {
        append(text)
        return
    }
    var i = 0
    while (true) {
        val j = text.indexOf(query, i, ignoreCase = true)
        if (j < 0) {
            append(text.substring(i))
            return
        }
        append(text.substring(i, j))
        withStyle(SpanStyle(background = mark, color = LoggerColors.Bg)) { append(text.substring(j, j + query.length)) }
        i = j + query.length
    }
}

private fun describe(
    header: String,
    explain: String?,
    entry: LogEntry,
    sel: Float,
    fontSp: Int,
    query: String,
    current: Boolean,
): AnnotatedString {
    val headerColor = lerp(entry.levelColor, LoggerColors.Bg, sel)
    val bodyColor = lerp(LoggerColors.Dim, LoggerColors.Bg, sel)
    return buildAnnotatedString {
        withStyle(SpanStyle(color = LoggerColors.Dim)) { append("> ") }
        withStyle(SpanStyle(color = headerColor, fontWeight = FontWeight.Bold)) { append(header) }
        if (explain != null) withStyle(SpanStyle(color = headerColor)) { append("\n$explain") }
        withStyle(SpanStyle(color = bodyColor, fontSize = (fontSp * 0.8f).sp)) {
            append("\n")
            // The match being navigated to is green, the rest yellow.
            appendMarked(entry.raw, query, if (current) LoggerColors.Fg else LoggerColors.Yellow)
        }
    }
}

private fun copy(context: Context, raw: String) {
    context.getSystemService(ClipboardManager::class.java).setPrimaryClip(ClipData.newPlainText("log", raw))
    Toast.makeText(context, R.string.copied, Toast.LENGTH_SHORT).show()
}

private fun share(context: Context, raw: String) {
    val send = Intent(Intent.ACTION_SEND).setType("text/plain")
        .putExtra(Intent.EXTRA_TEXT, context.getString(R.string.prompt_template, raw))
    context.startActivity(Intent.createChooser(send, context.getString(R.string.share_title)))
}
