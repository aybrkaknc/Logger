package com.aybrkaknc.logger.ui.settings

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.provider.DocumentsContract
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.settings.Prefs
import com.aybrkaknc.logger.ui.ScreenHeader
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors

private enum class Sheet { MaxSize, FontSize }

private const val MAX_GB = 10

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(onBack: () -> Unit) {
    val context = LocalContext.current
    val prefs = remember { Prefs(context) }
    var maxGb by remember { mutableIntStateOf(((prefs.maxMb + 512) / 1024).coerceIn(1, MAX_GB)) }
    var fontSp by remember { mutableIntStateOf(prefs.fontSp) }
    var folder by remember { mutableStateOf(prefs.exportName ?: Prefs.EXPORT_DIR) }
    var sheet by remember { mutableStateOf<Sheet?>(null) }
    var language by remember { mutableStateOf(prefs.language) }
    var langOpen by remember { mutableStateOf(false) }
    var singleLine by remember { mutableStateOf(prefs.singleLine) }
    var crashAlert by remember { mutableStateOf(prefs.crashAlert) }
    var buffers by remember { mutableStateOf(prefs.buffers) }
    var buffersOpen by remember { mutableStateOf(false) }

    val picker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            context.contentResolver.takePersistableUriPermission(
                uri, Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION,
            )
            val name = folderName(uri)
            prefs.exportTree = uri.toString()
            prefs.exportName = name
            folder = name
        }
    }

    Column(Modifier.fillMaxSize().background(LoggerColors.Bg)) {
        ScreenHeader(stringResource(R.string.settings_title), onBack)
        SettingRow(stringResource(R.string.settings_max_size), stringResource(R.string.size_gb, maxGb)) { sheet = Sheet.MaxSize }
        SettingRow(stringResource(R.string.settings_font_size), fontSp.toString()) { sheet = Sheet.FontSize }
        SettingRow(stringResource(R.string.settings_output), folder) { picker.launch(null) }
        SettingRow(stringResource(R.string.settings_language), languageName(language)) { langOpen = true }
        SettingRow(stringResource(R.string.settings_single_line), onOffName(singleLine)) {
            singleLine = !singleLine
            prefs.singleLine = singleLine
        }
        SettingRow(stringResource(R.string.settings_crash_alert), onOffName(crashAlert)) {
            crashAlert = !crashAlert
            prefs.crashAlert = crashAlert
        }
        SettingRow(stringResource(R.string.settings_buffers), (Prefs.CORE_BUFFERS + buffers).distinct().joinToString(", "), valueSize = 16) { buffersOpen = true }
    }

    if (buffersOpen) {
        ModalBottomSheet(onDismissRequest = { buffersOpen = false }, containerColor = LoggerColors.Panel) {
            Column(Modifier.padding(horizontal = 20.dp).navigationBarsPadding()) {
                Text(stringResource(R.string.settings_buffers), color = LoggerColors.Label, fontFamily = JetBrainsMono, fontSize = 13.sp, modifier = Modifier.padding(bottom = 8.dp))
                for (b in Prefs.EXTRA_BUFFERS) {
                    val on = b in buffers
                    Text(
                        (if (on) "[x] " else "[ ] ") + b,
                        color = if (on) LoggerColors.Fg else LoggerColors.Dim,
                        fontFamily = JetBrainsMono,
                        fontSize = 16.sp,
                        modifier = Modifier.fillMaxWidth().clickable {
                            buffers = if (on) buffers - b else buffers + b
                            prefs.buffers = buffers
                        }.padding(vertical = 14.dp),
                    )
                }
                Text(stringResource(R.string.buffers_note), color = LoggerColors.Dim, fontFamily = JetBrainsMono, fontSize = 12.sp, modifier = Modifier.padding(top = 4.dp, bottom = 16.dp))
            }
        }
    }

    if (langOpen) {
        ModalBottomSheet(onDismissRequest = { langOpen = false }, containerColor = LoggerColors.Panel) {
            Column(Modifier.padding(horizontal = 20.dp).navigationBarsPadding()) {
                for (code in listOf("system", "en", "tr")) {
                    Text(
                        languageName(code),
                        color = if (code == language) LoggerColors.Fg else LoggerColors.Dim,
                        fontFamily = JetBrainsMono,
                        fontSize = 16.sp,
                        modifier = Modifier.fillMaxWidth().clickable {
                            prefs.language = code
                            language = code
                            langOpen = false
                            // Recreate so the new locale applies to every string on screen.
                            (context as? Activity)?.recreate()
                        }.padding(vertical = 14.dp),
                    )
                }
            }
        }
    }

    sheet?.let { current ->
        val (title, items, initial) = when (current) {
            Sheet.MaxSize -> Triple(
                stringResource(R.string.settings_max_size),
                (1..MAX_GB).map { context.getString(R.string.size_gb, it) },
                maxGb - 1,
            )
            Sheet.FontSize -> Triple(
                stringResource(R.string.settings_font_size),
                (Prefs.FONT_MIN..Prefs.FONT_MAX).map { it.toString() },
                fontSp - Prefs.FONT_MIN,
            )
        }
        var picked by remember(current) { mutableIntStateOf(initial) }
        ModalBottomSheet(onDismissRequest = { sheet = null }, containerColor = LoggerColors.Panel) {
            Column(Modifier.padding(horizontal = 20.dp).navigationBarsPadding()) {
                Text(title, color = LoggerColors.Label, fontFamily = JetBrainsMono, fontSize = 13.sp, modifier = Modifier.padding(bottom = 8.dp))
                WheelPicker(items, initial) { picked = it }
                Spacer(Modifier.height(12.dp))
                Button(
                    onClick = {
                        when (current) {
                            Sheet.MaxSize -> {
                                maxGb = picked + 1
                                prefs.maxMb = maxGb * 1024
                            }
                            Sheet.FontSize -> {
                                fontSp = picked + Prefs.FONT_MIN
                                prefs.fontSp = fontSp
                            }
                        }
                        sheet = null
                    },
                    shape = RoundedCornerShape(10.dp),
                    colors = ButtonDefaults.buttonColors(containerColor = LoggerColors.Fg, contentColor = LoggerColors.Bg),
                    modifier = Modifier.fillMaxWidth(),
                ) {
                    Text(stringResource(R.string.save), fontFamily = JetBrainsMono, fontWeight = FontWeight.Bold)
                }
                Spacer(Modifier.height(16.dp))
            }
        }
    }
}

// "primary:Documents/Logs" -> "Documents/Logs"
private fun folderName(uri: Uri): String {
    val id = DocumentsContract.getTreeDocumentId(uri)
    return id.substringAfter(':').ifEmpty { id }
}

@Composable
private fun SettingRow(label: String, value: String, valueSize: Int = 22, onClick: () -> Unit) {
    Column(Modifier.fillMaxWidth().clickable(onClick = onClick).padding(20.dp)) {
        Text(label.uppercase(), color = LoggerColors.Label, fontFamily = JetBrainsMono, fontSize = 12.sp, letterSpacing = 1.sp)
        Text(
            value,
            color = LoggerColors.Fg,
            fontFamily = JetBrainsMono,
            fontSize = valueSize.sp,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            modifier = Modifier.padding(top = 6.dp),
        )
    }
    Box(Modifier.fillMaxWidth().height(1.dp).background(LoggerColors.Divider))
}

@Composable
private fun onOffName(on: Boolean): String = stringResource(if (on) R.string.onoff_on else R.string.onoff_off)

@Composable
private fun languageName(code: String): String = when (code) {
    "en" -> "English"
    "tr" -> "Türkçe"
    else -> stringResource(R.string.lang_system)
}
