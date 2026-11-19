package com.aybrkaknc.logger.ui.files

import androidx.activity.compose.BackHandler
import android.content.ClipData
import android.content.Context
import android.content.Intent
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.log.LogFileItem
import com.aybrkaknc.logger.log.LogFiles
import com.aybrkaknc.logger.ui.IconBtn
import com.aybrkaknc.logger.ui.LoggerField
import com.aybrkaknc.logger.ui.ScreenHeader
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

@OptIn(ExperimentalFoundationApi::class)
// Root shows the buffer folders (and older top-level exports); a folder shows its files.
@Composable
fun FilesScreen(onBack: () -> Unit, onOpen: (LogFileItem) -> Unit) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    var query by rememberSaveable { mutableStateOf("") }
    var folder by rememberSaveable { mutableStateOf<String?>(null) }
    var files by remember { mutableStateOf<List<LogFileItem>>(emptyList()) }
    var toDelete by remember { mutableStateOf<LogFileItem?>(null) }
    var confirmMany by remember { mutableStateOf(false) }
    // The file being opened: its row flashes green briefly before the viewer opens.
    var opening by remember { mutableStateOf<String?>(null) }
    // Keys (file URIs) of the picked files; non-empty means selection mode is on.
    var selected by remember { mutableStateOf<Set<String>>(emptySet()) }
    var reload by remember { mutableIntStateOf(0) }

    LaunchedEffect(reload) {
        files = withContext(Dispatchers.IO) { LogFiles.list(context) }
    }

    BackHandler(enabled = selected.isNotEmpty()) { selected = emptySet() }
    BackHandler(enabled = folder != null) { folder = null }
    LaunchedEffect(folder) { selected = emptySet() }

    val q = query.trim()
    val folders = files.map { it.folder }.filter { it.isNotEmpty() }.distinct().sorted()
    val inFolder = if (folder == null) files.filter { it.folder.isEmpty() } else files.filter { it.folder == folder }
    val shown = if (q.isEmpty()) inFolder else inFolder.filter { it.name.contains(q, ignoreCase = true) }

    Column(Modifier.fillMaxSize().background(LoggerColors.Bg)) {
        if (selected.isNotEmpty()) {
            Row(
                Modifier.fillMaxWidth().statusBarsPadding().padding(horizontal = 8.dp, vertical = 8.dp),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                IconBtn(R.drawable.ic_back, R.string.cancel, onClick = { selected = emptySet() })
                Spacer(Modifier.width(8.dp))
                Text(
                    stringResource(R.string.files_selected, selected.size),
                    color = LoggerColors.Fg,
                    fontFamily = JetBrainsMono,
                    fontWeight = FontWeight.Bold,
                    fontSize = 14.sp,
                )
                Spacer(Modifier.weight(1f))
                TextButton(onClick = { selected = shown.map { it.uri.toString() }.toSet() }) {
                    Text(stringResource(R.string.action_select_all), color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontSize = 12.sp)
                }
                IconBtn(R.drawable.ic_share, R.string.action_share, onClick = {
                    val picked = files.filter { it.uri.toString() in selected }
                    shareFiles(context, picked)
                    selected = emptySet()
                })
                IconBtn(R.drawable.ic_clear, R.string.action_delete, onClick = { confirmMany = true })
            }
        } else {
            ScreenHeader(folder ?: stringResource(R.string.files_title), onBack = { if (folder != null) folder = null else onBack() })
        }
        LoggerField(
            query,
            { query = it },
            stringResource(R.string.files_search_hint),
            Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
        )
        LazyColumn(Modifier.fillMaxSize()) {
            if (folder == null) {
                item { Spacer(Modifier.height(16.dp)) }
                items(folders) { name ->
                    val count = files.count { it.folder == name }
                    Row(
                        Modifier.fillMaxWidth().clickable { folder = name }.padding(horizontal = 16.dp, vertical = 12.dp),
                        verticalAlignment = Alignment.CenterVertically,
                    ) {
                        Image(painterResource(R.drawable.ic_folder), null, Modifier.size(24.dp))
                        Spacer(Modifier.width(12.dp))
                        Column(Modifier.weight(1f)) {
                            Text(name, color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontWeight = FontWeight.Bold, fontSize = 14.sp)
                            Text(
                                stringResource(R.string.files_count, count),
                                color = LoggerColors.Dim,
                                fontFamily = JetBrainsMono,
                                fontSize = 11.sp,
                            )
                        }
                    }
                }
            }
            items(shown, key = { it.uri.toString() }) { item ->
                val key = item.uri.toString()
                val on = key in selected || key == opening
                val ink = if (on) LoggerColors.Bg else LoggerColors.Fg
                val bg by animateColorAsState(if (on) LoggerColors.Fg else LoggerColors.Bg, tween(60), label = "fileRow")
                Row(
                    Modifier.fillMaxWidth()
                        .background(bg)
                        .combinedClickable(
                            onClick = {
                                if (selected.isEmpty()) {
                                    opening = key
                                    scope.launch {
                                        delay(90)
                                        onOpen(item)
                                        opening = null
                                    }
                                } else {
                                    selected = selected.toggle(key)
                                }
                            },
                            onLongClick = { selected = selected.toggle(item.uri.toString()) },
                        )
                        .padding(horizontal = 16.dp, vertical = 10.dp),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    Column(Modifier.weight(1f)) {
                        Text(item.name, color = ink, fontFamily = JetBrainsMono, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                        Text(
                            "${formatDate(item.modified)}  ${formatSize(item.size)}",
                            color = if (on) LoggerColors.Bg else LoggerColors.Dim,
                            fontFamily = JetBrainsMono,
                            fontSize = 11.sp,
                        )
                    }
                    Spacer(Modifier.width(8.dp))
                    IconBtn(R.drawable.ic_clear, R.string.action_delete, onClick = { toDelete = item }, tint = ink)
                }
            }
            if (folder == null && folders.isEmpty() && shown.isEmpty()) {
                item {
                    Text(
                        stringResource(R.string.files_empty),
                        color = LoggerColors.Dim,
                        fontFamily = JetBrainsMono,
                        fontSize = 13.sp,
                        modifier = Modifier.padding(32.dp),
                    )
                }
            }
        }
    }

    if (confirmMany) {
        val count = selected.size
        AlertDialog(
            onDismissRequest = { confirmMany = false },
            containerColor = LoggerColors.Panel,
            title = { Text(stringResource(R.string.delete_title), color = LoggerColors.Fg, fontFamily = JetBrainsMono) },
            text = { Text(stringResource(R.string.delete_many_text, count), color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontSize = 13.sp) },
            confirmButton = {
                TextButton(onClick = {
                    confirmMany = false
                    val targets = files.filter { it.uri.toString() in selected }
                    selected = emptySet()
                    // Permanent: only runs after this confirmation.
                    scope.launch {
                        withContext(Dispatchers.IO) { targets.forEach { LogFiles.delete(context, it) } }
                        reload++
                    }
                }) { Text(stringResource(R.string.action_delete), color = LoggerColors.Red) }
            },
            dismissButton = {
                TextButton(onClick = { confirmMany = false }) { Text(stringResource(R.string.cancel), color = LoggerColors.Dim) }
            },
        )
    }

    toDelete?.let { item ->
        AlertDialog(
            onDismissRequest = { toDelete = null },
            containerColor = LoggerColors.Panel,
            title = { Text(stringResource(R.string.delete_title), color = LoggerColors.Fg, fontFamily = JetBrainsMono) },
            text = { Text(stringResource(R.string.delete_text, item.name), color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontSize = 13.sp) },
            confirmButton = {
                TextButton(onClick = {
                    toDelete = null
                    // Deleting is permanent: only ever runs after this confirmation.
                    scope.launch {
                        withContext(Dispatchers.IO) { LogFiles.delete(context, item) }
                        reload++
                    }
                }) { Text(stringResource(R.string.action_delete), color = LoggerColors.Red) }
            },
            dismissButton = {
                TextButton(onClick = { toDelete = null }) { Text(stringResource(R.string.cancel), color = LoggerColors.Dim) }
            },
        )
    }
}

// Several files at once: one ACTION_SEND_MULTIPLE with a read grant on each URI.
private fun shareFiles(context: Context, items: List<LogFileItem>) {
    if (items.isEmpty()) return
    val send = Intent(Intent.ACTION_SEND_MULTIPLE).setType("text/plain")
        .putParcelableArrayListExtra(Intent.EXTRA_STREAM, ArrayList(items.map { it.uri }))
        .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
    val clip = ClipData.newUri(context.contentResolver, items[0].name, items[0].uri)
    items.drop(1).forEach { clip.addItem(ClipData.Item(it.uri)) }
    send.clipData = clip
    context.startActivity(Intent.createChooser(send, context.getString(R.string.action_share)))
}

private fun Set<String>.toggle(key: String): Set<String> = if (key in this) this - key else this + key

private fun formatDate(ms: Long): String = SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.US).format(Date(ms))

private fun formatSize(bytes: Long): String = when {
    bytes >= 1L shl 20 -> "%.1f MB".format(bytes / (1024.0 * 1024.0))
    bytes >= 1L shl 10 -> "%.0f KB".format(bytes / 1024.0)
    else -> "$bytes B"
}
