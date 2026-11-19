package com.aybrkaknc.logger.ui.settings

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.DocumentsContract
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Switch
import androidx.compose.material3.SwitchDefaults
import androidx.compose.material3.Text
import androidx.compose.ui.Alignment
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.service.ShizukuStatus
import com.aybrkaknc.logger.settings.Prefs
import com.aybrkaknc.logger.ui.IconBtn
import com.aybrkaknc.logger.ui.ScreenHeader
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

private enum class Sheet { MaxSize, FontSize }

private const val MAX_GB = 10

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(onBack: () -> Unit, shizuku: ShizukuStatus) {
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

    Column(Modifier.fillMaxSize().background(LoggerColors.Bg).verticalScroll(rememberScrollState())) {
        ScreenHeader(stringResource(R.string.settings_title), onBack) {
            IconBtn(R.drawable.ic_restart, R.string.action_restart, onClick = { restartApp(context) })
        }
        SectionHeader(stringResource(R.string.settings_section_access))
        val shizukuState = when (shizuku) {
            ShizukuStatus.READY -> null
            ShizukuStatus.NO_PERMISSION -> R.string.shizuku_state_no_permission
            ShizukuStatus.NOT_RUNNING -> R.string.shizuku_state_not_running
        }
        StatusRow(stringResource(R.string.settings_shizuku), shizukuState, shizuku != ShizukuStatus.NOT_RUNNING) { openShizuku(context) }
        // Root is checked when the screen opens and again on every tap of the row.
        var rooted by remember { mutableStateOf(false) }
        val scope = rememberCoroutineScope()
        LaunchedEffect(Unit) { rooted = withContext(Dispatchers.IO) { hasRoot() } }
        StatusRow(stringResource(R.string.settings_root), null, rooted) {
            scope.launch { rooted = withContext(Dispatchers.IO) { hasRoot() } }
        }
        SectionHeader(stringResource(R.string.settings_section_recording))
        SettingRow(stringResource(R.string.settings_max_size), stringResource(R.string.size_gb, maxGb)) { sheet = Sheet.MaxSize }
        SettingRow(stringResource(R.string.settings_output), folder) { picker.launch(null) }
        SettingRow(stringResource(R.string.settings_buffers), (Prefs.CORE_BUFFERS + buffers).distinct().joinToString(", ")) { buffersOpen = true }
        SwitchRow(stringResource(R.string.settings_crash_alert), crashAlert) {
            crashAlert = it
            prefs.crashAlert = it
        }
        SectionHeader(stringResource(R.string.settings_section_display))
        SettingRow(stringResource(R.string.settings_font_size), fontSp.toString()) { sheet = Sheet.FontSize }
        SwitchRow(stringResource(R.string.settings_single_line), singleLine) {
            singleLine = it
            prefs.singleLine = it
        }
        SettingRow(stringResource(R.string.settings_language), languageName(language)) { langOpen = true }
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

private const val SHIZUKU_PACKAGE = "moe.shizuku.privileged.api"

// Opens a fresh main screen in a new task; the process stays alive, so a running recording keeps going.
private fun restartApp(context: Context) {
    val intent = context.packageManager.getLaunchIntentForPackage(context.packageName) ?: return
    context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK))
}

private fun openShizuku(context: Context) {
    context.packageManager.getLaunchIntentForPackage(SHIZUKU_PACKAGE)?.let { context.startActivity(it) }
}

// Asks for root with su; no answer, a refusal or a missing su all count as not connected.
private fun hasRoot(): Boolean = try {
    val process = Runtime.getRuntime().exec(arrayOf("su", "-c", "id"))
    val out = process.inputStream.bufferedReader().readText()
    process.waitFor()
    out.contains("uid=0")
} catch (_: Exception) {
    false
}

// "primary:Documents/Logs" -> "Documents/Logs"
private fun folderName(uri: Uri): String {
    val id = DocumentsContract.getTreeDocumentId(uri)
    return id.substringAfter(':').ifEmpty { id }
}

@Composable
private fun SectionHeader(title: String) {
    Text(
        title,
        color = LoggerColors.Fg,
        fontFamily = JetBrainsMono,
        fontWeight = FontWeight.Bold,
        fontSize = 13.sp,
        modifier = Modifier.padding(start = 16.dp, top = 24.dp, bottom = 4.dp),
    )
}

// Title with the current value underneath, like the system settings list.
@Composable
private fun SettingRow(title: String, summary: String, onClick: () -> Unit) {
    Column(Modifier.fillMaxWidth().clickable(onClick = onClick).padding(horizontal = 16.dp, vertical = 14.dp)) {
        Text(title, color = LoggerColors.Soft, fontFamily = JetBrainsMono, fontSize = 16.sp)
        Text(
            summary,
            color = LoggerColors.Gray,
            fontFamily = JetBrainsMono,
            fontSize = 13.sp,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            modifier = Modifier.padding(top = 2.dp),
        )
    }
}

// Title with a connection indicator on the right; the optional state text sits under the title.
@Composable
private fun StatusRow(title: String, state: Int?, connected: Boolean, onClick: () -> Unit) {
    val color = if (connected) LoggerColors.Fg else LoggerColors.Red
    Row(
        Modifier.fillMaxWidth().clickable(onClick = onClick).padding(horizontal = 16.dp, vertical = 14.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Column(Modifier.weight(1f)) {
            Text(title, color = LoggerColors.Soft, fontFamily = JetBrainsMono, fontSize = 16.sp)
            if (state != null) {
                Text(
                    stringResource(state),
                    color = LoggerColors.Gray,
                    fontFamily = JetBrainsMono,
                    fontSize = 13.sp,
                    modifier = Modifier.padding(top = 2.dp),
                )
            }
        }
        Box(Modifier.size(8.dp).background(color, CircleShape))
        Spacer(Modifier.width(6.dp))
        Text(
            stringResource(if (connected) R.string.shizuku_connected else R.string.shizuku_disconnected),
            color = color,
            fontFamily = JetBrainsMono,
            fontSize = 12.sp,
        )
    }
}

// Whole row toggles; the switch only shows the state.
@Composable
private fun SwitchRow(title: String, checked: Boolean, onChange: (Boolean) -> Unit) {
    Row(
        Modifier.fillMaxWidth().clickable { onChange(!checked) }.padding(horizontal = 16.dp, vertical = 14.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Text(title, color = LoggerColors.Soft, fontFamily = JetBrainsMono, fontSize = 16.sp, modifier = Modifier.weight(1f))
        Switch(
            checked = checked,
            onCheckedChange = null,
            colors = SwitchDefaults.colors(
                checkedThumbColor = LoggerColors.Bg,
                checkedTrackColor = LoggerColors.Fg,
                uncheckedThumbColor = LoggerColors.Gray,
                uncheckedTrackColor = LoggerColors.Panel,
                uncheckedBorderColor = LoggerColors.Gray,
            ),
        )
    }
}

@Composable
private fun languageName(code: String): String = when (code) {
    "en" -> "English"
    "tr" -> "Türkçe"
    else -> stringResource(R.string.lang_system)
}
