package com.aybrkaknc.logger.ui.main

import android.widget.Toast
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.animation.expandVertically
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Icon
import androidx.compose.material3.Surface
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
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.lifecycle.repeatOnLifecycle
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.export.ExportManager
import com.aybrkaknc.logger.log.LogDescriber
import com.aybrkaknc.logger.log.LogEntry
import com.aybrkaknc.logger.log.LogFilter
import com.aybrkaknc.logger.log.LogRepository
import com.aybrkaknc.logger.service.LogService
import com.aybrkaknc.logger.service.ShizukuStatus
import com.aybrkaknc.logger.settings.Prefs
import com.aybrkaknc.logger.ui.IconBtn
import com.aybrkaknc.logger.ui.LoggerField
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import com.aybrkaknc.logger.ui.theme.TitleStyle
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

private class Keyed(val key: String, val entry: LogEntry)

@Composable
fun MainScreen(
    shizuku: ShizukuStatus,
    onToggle: () -> Unit,
    onOpenFilter: () -> Unit,
    onOpenSettings: () -> Unit,
) {
    val context = LocalContext.current
    val prefs = remember { Prefs(context) }
    val repo = remember { LogRepository(context) }
    val describer = remember { LogDescriber(context) }
    val running by LogService.running.collectAsStateWithLifecycle()

    var rows by remember { mutableStateOf<List<Keyed>>(emptyList()) }
    var filterActive by remember { mutableStateOf(false) }
    var fontSp by remember { mutableIntStateOf(prefs.fontSp) }
    var searchOpen by rememberSaveable { mutableStateOf(prefs.text.isNotEmpty()) }
    var searchText by rememberSaveable { mutableStateOf(prefs.text) }
    var exportDialog by remember { mutableStateOf(false) }
    val listState = rememberLazyListState()
    val scope = rememberCoroutineScope()

    // Reload the tail of the filtered log once per second while visible; restarts immediately on search changes.
    val lifecycle = LocalLifecycleOwner.current.lifecycle
    LaunchedEffect(lifecycle, searchText) {
        lifecycle.repeatOnLifecycle(Lifecycle.State.RESUMED) {
            var lastKey: String? = null
            var lastLength = -1L
            while (true) {
                fontSp = prefs.fontSp
                val result = withContext(Dispatchers.IO) {
                    val filter = LogFilter.from(context, prefs)
                    val file = repo.filteredFile
                    val length = file.length()
                    if (filter.key == lastKey && length == lastLength) {
                        Triple(filter, length, null)
                    } else {
                        Triple(filter, length, withKeys(repo.recentLines(file, filter).map(describer::describe)))
                    }
                }
                filterActive = result.first.isActive
                lastKey = result.first.key
                lastLength = result.second
                result.third?.let { new ->
                    val atTop = listState.firstVisibleItemIndex == 0
                    rows = new
                    if (atTop) listState.requestScrollToItem(0)
                }
                delay(1000)
            }
        }
    }

    Box(Modifier.fillMaxSize().background(LoggerColors.Bg)) {
        Column(Modifier.fillMaxSize()) {
            Header(shizuku)
            FilterBar(
                active = filterActive,
                onOpenFilter = onOpenFilter,
                onSearch = {
                    if (searchOpen) {
                        searchText = ""
                        prefs.text = ""
                    }
                    searchOpen = !searchOpen
                },
                onExport = { exportDialog = true },
                onSettings = onOpenSettings,
            )
            Box(Modifier.fillMaxWidth().height(2.dp).background(LoggerColors.Fg))
            AnimatedVisibility(searchOpen, enter = expandVertically(tween(220)), exit = shrinkVertically(tween(220))) {
                SearchField(searchText) {
                    searchText = it
                    prefs.text = it
                }
            }
            if (rows.isEmpty()) {
                EmptyState(shizuku)
            } else {
                LazyColumn(
                    state = listState,
                    contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 12.dp, bottom = 120.dp),
                    modifier = Modifier.fillMaxSize(),
                ) {
                    items(rows, key = { it.key }) { LogRow(it.entry, fontSp, Modifier.animateItem()) }
                }
            }
        }
        ToggleButton(running, onToggle, Modifier.align(Alignment.BottomEnd).navigationBarsPadding().padding(24.dp))
    }

    if (exportDialog) {
        ExportDialog(
            onDismiss = { exportDialog = false },
            onPick = { all ->
                exportDialog = false
                scope.launch {
                    val file = if (all) repo.allFile else repo.filteredFile
                    val prefix = if (all) ExportManager.PREFIX_ALL else ExportManager.PREFIX_FILTERED
                    val shown = withContext(Dispatchers.IO) { ExportManager.export(context, file, prefix) }
                    val msg = if (shown != null) context.getString(R.string.exported, shown) else context.getString(R.string.export_failed)
                    Toast.makeText(context, msg, Toast.LENGTH_LONG).show()
                }
            },
        )
    }
}

// Identical log lines can repeat; number occurrences from the oldest so keys stay stable as new lines arrive on top.
private fun withKeys(entries: List<LogEntry>): List<Keyed> {
    val seen = HashMap<String, Int>()
    val out = arrayOfNulls<Keyed>(entries.size)
    for (i in entries.indices.reversed()) {
        val raw = entries[i].raw
        val n = seen.merge(raw, 1, Int::plus)!!
        out[i] = Keyed("$raw#$n", entries[i])
    }
    return out.map { it!! }
}

@Composable
private fun Header(shizuku: ShizukuStatus) {
    Row(
        Modifier.fillMaxWidth().background(LoggerColors.Panel).statusBarsPadding()
            .padding(start = 16.dp, end = 16.dp, top = 16.dp, bottom = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Text(stringResource(R.string.title_main), style = TitleStyle)
        Spacer(Modifier.width(10.dp))
        SittingCat()
        Spacer(Modifier.weight(1f))
        val (color, label) = when (shizuku) {
            ShizukuStatus.READY -> LoggerColors.Fg to R.string.shizuku_ok
            ShizukuStatus.NO_PERMISSION -> LoggerColors.Yellow to R.string.shizuku_ok
            ShizukuStatus.NOT_RUNNING -> LoggerColors.Red to R.string.shizuku_missing
        }
        Box(Modifier.size(8.dp).background(color, CircleShape))
        Spacer(Modifier.width(6.dp))
        Text(stringResource(label), color = LoggerColors.Dim, fontFamily = JetBrainsMono, fontSize = 10.sp)
    }
}

@Composable
private fun FilterBar(active: Boolean, onOpenFilter: () -> Unit, onSearch: () -> Unit, onExport: () -> Unit, onSettings: () -> Unit) {
    Row(
        Modifier.fillMaxWidth().background(LoggerColors.Panel).clickable(onClick = onOpenFilter)
            .padding(horizontal = 12.dp, vertical = 2.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Icon(painterResource(R.drawable.ic_filter), stringResource(R.string.action_filter), tint = LoggerColors.Fg, modifier = Modifier.size(24.dp))
        Text(
            stringResource(if (active) R.string.filter_active else R.string.filter_none),
            color = if (active) LoggerColors.Fg else LoggerColors.Dim,
            fontFamily = JetBrainsMono,
            fontWeight = FontWeight.Bold,
            fontSize = 14.sp,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            modifier = Modifier.weight(1f).padding(start = 12.dp),
        )
        IconBtn(R.drawable.ic_search, R.string.action_search, onSearch)
        IconBtn(R.drawable.ic_export, R.string.action_export, onExport)
        IconBtn(R.drawable.ic_settings, R.string.action_settings, onSettings)
    }
}

@Composable
private fun SearchField(text: String, onChange: (String) -> Unit) {
    val focus = remember { FocusRequester() }
    val keyboard = LocalSoftwareKeyboardController.current
    LoggerField(
        value = text,
        onValueChange = onChange,
        hint = stringResource(R.string.filter_text_hint),
        modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp).focusRequester(focus),
    )
    LaunchedEffect(Unit) {
        focus.requestFocus()
        keyboard?.show()
    }
}

@Composable
private fun EmptyState(shizuku: ShizukuStatus) {
    Column(
        Modifier.fillMaxSize().padding(32.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Text(stringResource(R.string.empty_logs), color = LoggerColors.Dim, fontFamily = JetBrainsMono, fontSize = 13.sp, textAlign = TextAlign.Center)
        val warning = when (shizuku) {
            ShizukuStatus.NOT_RUNNING -> R.string.shizuku_not_running
            ShizukuStatus.NO_PERMISSION -> R.string.shizuku_denied
            ShizukuStatus.READY -> null
        }
        if (warning != null) {
            Spacer(Modifier.height(16.dp))
            Text(stringResource(warning), color = LoggerColors.Red, fontFamily = JetBrainsMono, fontSize = 13.sp, textAlign = TextAlign.Center)
        }
    }
}

@Composable
private fun ToggleButton(running: Boolean, onClick: () -> Unit, modifier: Modifier) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    val scale by animateFloatAsState(if (pressed) 0.9f else 1f, tween(if (pressed) 80 else 120), label = "press")
    Surface(
        onClick = onClick,
        shape = RoundedCornerShape(16.dp),
        color = LoggerColors.Fg,
        border = BorderStroke(2.dp, Color.Black),
        interactionSource = interaction,
        modifier = modifier.size(64.dp).graphicsLayer { scaleX = scale; scaleY = scale },
    ) {
        Icon(
            painterResource(if (running) R.drawable.ic_stop else R.drawable.ic_play),
            stringResource(if (running) R.string.action_stop else R.string.action_start),
            tint = LoggerColors.Panel,
            modifier = Modifier.padding(16.dp),
        )
    }
}

@Composable
private fun ExportDialog(onDismiss: () -> Unit, onPick: (all: Boolean) -> Unit) {
    AlertDialog(
        onDismissRequest = onDismiss,
        containerColor = LoggerColors.Panel,
        title = { Text(stringResource(R.string.export_title), color = LoggerColors.Fg, fontFamily = JetBrainsMono) },
        text = {
            Column {
                for ((all, label) in listOf(true to R.string.export_all, false to R.string.export_filtered)) {
                    Text(
                        stringResource(label),
                        color = LoggerColors.Fg,
                        fontFamily = JetBrainsMono,
                        modifier = Modifier.fillMaxWidth().clickable { onPick(all) }.padding(vertical = 12.dp),
                    )
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) { Text(stringResource(R.string.close), color = LoggerColors.Dim) }
        },
    )
}
