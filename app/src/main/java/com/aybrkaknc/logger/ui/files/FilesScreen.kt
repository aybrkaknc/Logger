package com.aybrkaknc.logger.ui.files

import androidx.activity.compose.BackHandler
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
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
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

// Root shows the raw-log and filtered-log folders (and older top-level exports); a folder shows its files.
@Composable
fun FilesScreen(onBack: () -> Unit, onOpen: (LogFileItem) -> Unit) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    var query by rememberSaveable { mutableStateOf("") }
    var folder by rememberSaveable { mutableStateOf<String?>(null) }
    var files by remember { mutableStateOf<List<LogFileItem>>(emptyList()) }
    var toDelete by remember { mutableStateOf<LogFileItem?>(null) }
    var reload by remember { mutableIntStateOf(0) }

    LaunchedEffect(reload) {
        files = withContext(Dispatchers.IO) { LogFiles.list(context) }
    }

    BackHandler(enabled = folder != null) { folder = null }

    val q = query.trim()
    val folders = files.map { it.folder }.filter { it.isNotEmpty() }.distinct().sorted()
    val inFolder = if (folder == null) files.filter { it.folder.isEmpty() } else files.filter { it.folder == folder }
    val shown = if (q.isEmpty()) inFolder else inFolder.filter { it.name.contains(q, ignoreCase = true) }

    Column(Modifier.fillMaxSize().background(LoggerColors.Bg)) {
        ScreenHeader(folder ?: stringResource(R.string.files_title), onBack = { if (folder != null) folder = null else onBack() })
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
                Row(
                    Modifier.fillMaxWidth()
                        .clickable { onOpen(item) }
                        .padding(horizontal = 16.dp, vertical = 10.dp),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    Column(Modifier.weight(1f)) {
                        Text(item.name, color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontWeight = FontWeight.Bold, fontSize = 13.sp)
                        Text(
                            "${formatDate(item.modified)}  ${formatSize(item.size)}",
                            color = LoggerColors.Dim,
                            fontFamily = JetBrainsMono,
                            fontSize = 11.sp,
                        )
                    }
                    Spacer(Modifier.width(8.dp))
                    IconBtn(R.drawable.ic_clear, R.string.action_delete, onClick = { toDelete = item })
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

private fun formatDate(ms: Long): String = SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.US).format(Date(ms))

private fun formatSize(bytes: Long): String = when {
    bytes >= 1L shl 20 -> "%.1f MB".format(bytes / (1024.0 * 1024.0))
    bytes >= 1L shl 10 -> "%.0f KB".format(bytes / 1024.0)
    else -> "$bytes B"
}
