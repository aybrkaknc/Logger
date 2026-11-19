package com.aybrkaknc.logger.ui.main

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.widget.Toast
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.IntrinsicSize
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.wrapContentWidth
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.selection.SelectionContainer
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.lerp
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.log.LogEntry
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import kotlinx.coroutines.delay

@Composable
fun LogRow(
    entry: LogEntry,
    fontSp: Int,
    singleLine: Boolean = false,
    query: String,
    current: Boolean,
    modifier: Modifier = Modifier,
    selected: Boolean = false,
    selectionMode: Boolean = false,
    onToggleSelect: () -> Unit = {},
    onStartSelect: () -> Unit = {},
) {
    val context = LocalContext.current
    var pressed by remember { mutableStateOf(false) }
    var selectDialog by remember { mutableStateOf(false) }
    var stackOpen by remember { mutableStateOf(false) }
    // Changing the selection mode cancels the pending press release, so the highlight would stay on without this.
    LaunchedEffect(selectionMode) { pressed = false }
    val toggle by rememberUpdatedState(onToggleSelect)
    val sel by animateFloatAsState(if (pressed || selected) 1f else 0f, tween(220), label = "sel")

    val explain = entry.explain?.let { stringResource(it) }

    Box(modifier.fillMaxWidth().padding(bottom = 12.dp)) {
        Column(Modifier.fillMaxWidth()) {
            Row(
                Modifier.fillMaxWidth()
                    .height(IntrinsicSize.Min)
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
                                // A tap opens the full text, so cut-off parts can be read.
                                onTap = { selectDialog = true },
                                onLongPress = { onStartSelect() },
                            )
                        }
                    }
                    .padding(vertical = 2.dp),
            ) {
                // Level name, centred in an unfilled strip and turned to read bottom to top.
                Row(Modifier.width(22.dp).fillMaxHeight()) {
                    // Level name turned and centred; the colour bar sits on its right, next to the log text.
                    Box(Modifier.weight(1f).fillMaxHeight(), contentAlignment = Alignment.Center) {
                        Text(
                            entry.badge,
                            color = lerp(entry.levelColor, LoggerColors.Bg, sel),
                            fontFamily = JetBrainsMono,
                            fontWeight = FontWeight.Bold,
                            fontSize = 11.sp,
                            letterSpacing = 1.sp,
                            maxLines = 1,
                            softWrap = false,
                            modifier = Modifier.wrapContentWidth(unbounded = true).graphicsLayer { rotationZ = -90f },
                        )
                    }
                    Box(Modifier.width(3.dp).fillMaxHeight().background(entry.levelColor))
                }
                Column(Modifier.weight(1f).padding(start = 6.dp, end = 4.dp)) {
                    // The meta line never wraps; it ends with "..." when the row is too narrow.
                    Text(
                        text = describeMeta(entry.time, null, entry, sel, fontSp),
                        fontFamily = JetBrainsMono,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                    Text(
                        text = describeBody(explain, entry, sel, fontSp, query, current),
                        fontFamily = JetBrainsMono,
                        fontSize = fontSp.sp,
                        maxLines = if (singleLine) 1 else Int.MAX_VALUE,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
            }
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
    }

    if (selectDialog) {
        AlertDialog(
            onDismissRequest = { selectDialog = false },
            containerColor = LoggerColors.Panel,
            confirmButton = {
                Row {
                    TextButton(onClick = { copy(context, entry.raw); selectDialog = false }) { Text(stringResource(R.string.copy_entry), color = LoggerColors.Fg) }
                    TextButton(onClick = { share(context, entry.raw); selectDialog = false }) { Text(stringResource(R.string.action_share), color = LoggerColors.Fg) }
                    TextButton(onClick = { selectDialog = false }) { Text(stringResource(R.string.close), color = LoggerColors.Fg) }
                }
            },
            text = {
                // One labelled line per field of the raw entry, then the explanation and the stack.
                val parts = rawFormat.find(entry.raw)?.groupValues
                SelectionContainer(Modifier.verticalScroll(rememberScrollState())) {
                    Column {
                        if (explain != null) {
                            Text(explain, color = entry.levelColor, fontFamily = JetBrainsMono, fontSize = fontSp.sp, modifier = Modifier.padding(bottom = 8.dp))
                        }
                        if (parts == null) {
                            Text(entry.raw, color = LoggerColors.Soft, fontFamily = JetBrainsMono, fontSize = fontSp.sp)
                        } else {
                            val fields = listOf(
                                R.string.field_date to parts[1],
                                R.string.field_time to parts[2],
                                R.string.field_uid to parts[3],
                                R.string.field_pid to parts[4],
                                R.string.field_tid to parts[5],
                                R.string.field_level to stringResource(entry.levelLabel),
                                R.string.field_tag to parts[7],
                                R.string.field_app to entry.app,
                                R.string.field_message to parts[8],
                            )
                            for ((label, value) in fields) {
                                if (value.isEmpty()) continue
                                Row(Modifier.padding(vertical = 2.dp)) {
                                    Text(
                                        stringResource(label),
                                        color = LoggerColors.Gray,
                                        fontFamily = JetBrainsMono,
                                        fontSize = (fontSp * 0.8f).sp,
                                        modifier = Modifier.width(88.dp),
                                    )
                                    Text(value, color = LoggerColors.Soft, fontFamily = JetBrainsMono, fontSize = fontSp.sp, modifier = Modifier.weight(1f))
                                }
                            }
                        }
                        if (entry.stack.isNotEmpty()) {
                            Text(
                                entry.stack.joinToString("\n"),
                                color = LoggerColors.Dim,
                                fontFamily = JetBrainsMono,
                                fontSize = (fontSp * 0.75f).sp,
                                modifier = Modifier.padding(top = 8.dp, start = 16.dp),
                            )
                        }
                    }
                }
            },
        )
    }
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

private fun describeMeta(
    time: String,
    levelText: String?,
    entry: LogEntry,
    sel: Float,
    fontSp: Int,
): AnnotatedString {
    val metaSize = (fontSp * 0.75f).sp
    val headerColor = lerp(entry.levelColor, LoggerColors.Bg, sel)
    return buildAnnotatedString {
        withStyle(SpanStyle(color = lerp(LoggerColors.Gray, LoggerColors.Bg, sel), fontSize = metaSize)) { append(time) }
        if (levelText != null) {
            withStyle(SpanStyle(color = headerColor, fontWeight = FontWeight.Bold, fontSize = metaSize)) { append("  $levelText") }
        }
        if (entry.app.isNotEmpty()) {
            withStyle(SpanStyle(color = lerp(entry.appColor, LoggerColors.Bg, sel), fontWeight = FontWeight.Bold, fontSize = metaSize)) { append("  ${entry.app}") }
        }
    }
}

// The meta line already shows the time, so the message drops the leading date and time.
// Threadtime format: date, time, uid, pid, tid, level, tag, message.
private val rawFormat = Regex("""^(\d{2}-\d{2}) (\d{2}:\d{2}:\d{2}\.\d{3})\s+(\d+)\s+(\d+)\s+(\d+)\s+(\w)\s+(.*?):\s?(.*)$""")
private val timestampPrefix = Regex("""^\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{3}\s+""")

private fun describeBody(
    explain: String?,
    entry: LogEntry,
    sel: Float,
    fontSp: Int,
    query: String,
    current: Boolean,
): AnnotatedString {
    val headerColor = lerp(entry.levelColor, LoggerColors.Bg, sel)
    val bodyColor = lerp(LoggerColors.Soft, LoggerColors.Bg, sel)
    return buildAnnotatedString {
        if (explain != null) withStyle(SpanStyle(color = headerColor)) { append(explain + "\n") }
        withStyle(SpanStyle(color = bodyColor, fontSize = (fontSp * 0.85f).sp)) {
            // The match being navigated to is green, the rest yellow.
            appendMarked(entry.raw.replace(timestampPrefix, ""), query, if (current) LoggerColors.Fg else LoggerColors.Yellow)
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
    context.startActivity(Intent.createChooser(send, context.getString(R.string.action_share)))
}
