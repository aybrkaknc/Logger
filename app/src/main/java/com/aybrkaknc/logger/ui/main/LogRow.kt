package com.aybrkaknc.logger.ui.main

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.widget.Toast
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.selection.SelectionContainer
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.lerp
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
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
import kotlinx.coroutines.delay

@Composable
fun LogRow(entry: LogEntry, fontSp: Int, modifier: Modifier = Modifier) {
    val context = LocalContext.current
    var pressed by remember { mutableStateOf(false) }
    var menu by remember { mutableStateOf(false) }
    var selectDialog by remember { mutableStateOf(false) }
    val sel by animateFloatAsState(if (pressed || menu) 1f else 0f, tween(220), label = "sel")

    val header = buildString {
        append(entry.time).append(" - ").append(stringResource(entry.levelLabel))
        if (entry.app.isNotEmpty()) append(" - ").append(entry.app)
    }
    val explain = entry.explain?.let { stringResource(it) }

    Box(modifier.fillMaxWidth().padding(bottom = 12.dp)) {
        Text(
            text = describe(header, explain, entry, sel, fontSp),
            fontFamily = JetBrainsMono,
            fontSize = fontSp.sp,
            modifier = Modifier.fillMaxWidth()
                .background(lerp(Color.Transparent, LoggerColors.Selected, sel), RoundedCornerShape(4.dp))
                .pointerInput(entry.raw) {
                    detectTapGestures(
                        onPress = {
                            pressed = true
                            tryAwaitRelease()
                            delay(150)
                            pressed = false
                        },
                        onLongPress = { menu = true },
                    )
                }
                .padding(horizontal = 4.dp, vertical = 2.dp),
        )
        DropdownMenu(
            expanded = menu,
            onDismissRequest = { menu = false },
            shape = RoundedCornerShape(8.dp),
            containerColor = LoggerColors.Panel,
            border = BorderStroke(1.dp, LoggerColors.Fg),
        ) {
            MenuItem(R.string.copy_entry) { menu = false; copy(context, entry.raw) }
            MenuItem(R.string.select_text) { menu = false; selectDialog = true }
            MenuItem(R.string.share_title) { menu = false; share(context, entry.raw) }
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

@Composable
private fun MenuItem(label: Int, onClick: () -> Unit) {
    DropdownMenuItem(
        text = { Text(stringResource(label), color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontSize = 13.sp) },
        onClick = onClick,
    )
}

private fun describe(header: String, explain: String?, entry: LogEntry, sel: Float, fontSp: Int): AnnotatedString {
    val headerColor = lerp(entry.levelColor, LoggerColors.White, sel)
    val bodyColor = lerp(LoggerColors.Dim, LoggerColors.White, sel)
    return buildAnnotatedString {
        withStyle(SpanStyle(color = headerColor, fontWeight = FontWeight.Bold)) { append(header) }
        if (explain != null) withStyle(SpanStyle(color = headerColor)) { append("\n$explain") }
        withStyle(SpanStyle(color = bodyColor, fontSize = (fontSp * 0.8f).sp)) { append("\n${entry.raw}") }
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
