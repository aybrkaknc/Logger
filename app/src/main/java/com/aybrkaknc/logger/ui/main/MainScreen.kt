package com.aybrkaknc.logger.ui.main

import android.widget.Toast
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.activity.compose.BackHandler
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.RowScope
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
import androidx.compose.runtime.derivedStateOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableLongStateOf
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
import androidx.compose.ui.draw.clip
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
import com.aybrkaknc.logger.ui.theme.centerCaps
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
    var paused by rememberSaveable { mutableStateOf(false) }
    // Byte offset in the filtered log at the last "clear screen"; lines before it are not shown.
    var clearedAt by rememberSaveable { mutableLongStateOf(0L) }
    var currentMatch by remember { mutableStateOf<String?>(null) }
    // Keys of rows picked in selection mode; non-empty means selection mode is on.
    var selected by remember { mutableStateOf<Set<String>>(emptySet()) }
    BackHandler(enabled = selected.isNotEmpty()) { selected = emptySet() }
    val listState = rememberLazyListState()
    // Shows the "back to top" button once the list is scrolled past the first few rows.
    val showTop by remember { derivedStateOf { listState.firstVisibleItemIndex > 5 } }
    val scope = rememberCoroutineScope()

    // Reload the tail of the filtered log once per second while visible. Restarts (and reloads at once) on search,
    // pause or clear changes. While paused only that first reload runs, so the list stays still.
    val lifecycle = LocalLifecycleOwner.current.lifecycle
    LaunchedEffect(lifecycle, searchText, paused, clearedAt) {
        lifecycle.repeatOnLifecycle(Lifecycle.State.RESUMED) {
            var lastKey: String? = null
            var lastLength = -1L
            var first = true
            while (true) {
                if (!paused || first) {
                    fontSp = prefs.fontSp
                    val file = repo.filteredFile
                    // The service trims the file when it grows too large, which invalidates the offset.
                    if (clearedAt > 0 && withContext(Dispatchers.IO) { file.length() } < clearedAt) {
                        clearedAt = 0L
                        return@repeatOnLifecycle
                    }
                    val result = withContext(Dispatchers.IO) {
                        val filter = LogFilter.from(context, prefs)
                        val length = file.length()
                        if (filter.key == lastKey && length == lastLength) {
                            Triple(filter, length, null)
                        } else {
                            Triple(filter, length, withKeys(repo.recentLines(file, filter, clearedAt).map { describer.describe(it) }))
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
                }
                first = false
                delay(1000)
            }
        }
    }

    val query = searchText.trim()
    val matches = remember(rows, query) {
        if (query.isEmpty()) emptyList() else rows.filter { it.entry.raw.contains(query, ignoreCase = true) }.map { it.key }
    }
    fun goToMatch(step: Int) {
        if (matches.isEmpty()) return
        val i = matches.indexOf(currentMatch)
        val next = if (i < 0) {
            if (step > 0) 0 else matches.lastIndex
        } else {
            (i + step).mod(matches.size)
        }
        val key = matches[next]
        currentMatch = key
        val row = rows.indexOfFirst { it.key == key }
        if (row >= 0) scope.launch { listState.animateScrollToItem(row) }
    }

    Box(Modifier.fillMaxSize().background(LoggerColors.Bg)) {
        Column(Modifier.fillMaxSize()) {
            Header(shizuku)
            if (selected.isNotEmpty()) {
                // Chronological (oldest first) text of the picked rows, stack frames included.
                fun pickedText() = rows.filter { it.key in selected }.reversed().joinToString("\n") { row ->
                    buildString {
                        append(row.entry.raw)
                        row.entry.stack.forEach { append("\n\t").append(it) }
                    }
                }
                SelectionBar(
                    count = selected.size,
                    onCopy = {
                        copyText(context, pickedText())
                        selected = emptySet()
                    },
                    onShare = {
                        shareText(context, pickedText())
                        selected = emptySet()
                    },
                    onCancel = { selected = emptySet() },
                )
            } else {
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
            }
            Box(Modifier.fillMaxWidth().height(2.dp).background(LoggerColors.Fg))
            AnimatedVisibility(searchOpen, enter = expandVertically(tween(220)), exit = shrinkVertically(tween(220))) {
                SearchField(
                    text = searchText,
                    position = matches.indexOf(currentMatch) + 1,
                    count = matches.size,
                    onPrev = { goToMatch(-1) },
                    onNext = { goToMatch(1) },
                ) {
                    searchText = it
                    prefs.text = it
                    currentMatch = null
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
                    items(rows, key = { it.key }) { row ->
                        LogRow(
                            entry = row.entry,
                            fontSp = fontSp,
                            query = query,
                            current = row.key == currentMatch,
                            modifier = Modifier.animateItem(),
                            selected = row.key in selected,
                            selectionMode = selected.isNotEmpty(),
                            onToggleSelect = {
                                selected = if (row.key in selected) selected - row.key else selected + row.key
                            },
                            onStartSelect = { selected = setOf(row.key) },
                        )
                    }
                }
            }
        }
        Row(
            Modifier.align(Alignment.BottomEnd).navigationBarsPadding().padding(24.dp),
            verticalAlignment = Alignment.Bottom,
            horizontalArrangement = Arrangement.spacedBy(12.dp),
        ) {
            // Clear and pause share the record button's 64dp height, so they centre on it.
            Row(
                Modifier.height(RecordSize),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(12.dp),
            ) {
                if (paused) {
                    Text(stringResource(R.string.paused), color = LoggerColors.Yellow, fontFamily = JetBrainsMono, fontWeight = FontWeight.Bold, fontSize = 12.sp)
                }
                SmallButton(R.drawable.ic_clear, R.string.action_clear) {
                    clearedAt = repo.filteredFile.length()
                    rows = emptyList()
                    currentMatch = null
                }
                SmallButton(
                    R.drawable.ic_pause,
                    if (paused) R.string.action_resume else R.string.action_pause,
                    active = paused,
                ) { paused = !paused }
            }
            // "Back to top" and the record button share one vertical axis.
            Column(horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(12.dp)) {
                AnimatedVisibility(showTop, enter = fadeIn(tween(150)), exit = fadeOut(tween(150))) {
                    SmallButton(R.drawable.ic_up, R.string.action_top) {
                        scope.launch { listState.animateScrollToItem(0) }
                    }
                }
                ToggleButton(running, onToggle, Modifier)
            }
        }
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
    val context = LocalContext.current
    Row(
        Modifier.fillMaxWidth().background(LoggerColors.Panel).statusBarsPadding()
            .padding(start = 16.dp, end = 16.dp, top = 16.dp, bottom = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        SittingCat()
        Spacer(Modifier.width(10.dp))
        // Title opens the project's GitHub repository.
        PressPill(onClick = { openUrl(context, GITHUB_URL) }) { pressed ->
            Text(
                stringResource(R.string.title_main),
                style = TitleStyle,
                color = if (pressed) LoggerColors.Bg else LoggerColors.Fg,
                modifier = Modifier.centerCaps(),
            )
        }
        Spacer(Modifier.weight(1f))
        val (color, label) = when (shizuku) {
            ShizukuStatus.READY -> LoggerColors.Fg to R.string.shizuku_ok
            ShizukuStatus.NO_PERMISSION -> LoggerColors.Yellow to R.string.shizuku_ok
            ShizukuStatus.NOT_RUNNING -> LoggerColors.Red to R.string.shizuku_missing
        }
        PressPill(onClick = { openShizuku(context) }) { pressed ->
            Box(Modifier.size(8.dp).background(if (pressed) LoggerColors.Bg else color, CircleShape))
            Spacer(Modifier.width(6.dp))
            Text(
                stringResource(label),
                color = if (pressed) LoggerColors.Bg else LoggerColors.Dim,
                fontFamily = JetBrainsMono,
                fontSize = 10.sp,
            )
        }
    }
}

// Rounded rectangle that shrinks and flashes green with black content while held.
@Composable
private fun PressPill(onClick: () -> Unit, content: @Composable RowScope.(pressed: Boolean) -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    val scale by animateFloatAsState(if (pressed) 0.95f else 1f, tween(if (pressed) 80 else 120), label = "headerPress")
    val shape = RoundedCornerShape(10.dp)
    Row(
        Modifier.graphicsLayer { scaleX = scale; scaleY = scale }
            .clip(shape)
            .background(if (pressed) LoggerColors.Fg else Color.Transparent, shape)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 8.dp, vertical = 4.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        content(pressed)
    }
}

private fun openUrl(context: Context, url: String) {
    context.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
}

private const val GITHUB_URL = "https://github.com/aybrkaknc/Logger"

private fun openShizuku(context: Context) {
    context.packageManager.getLaunchIntentForPackage(SHIZUKU_PACKAGE)?.let { context.startActivity(it) }
}

private const val SHIZUKU_PACKAGE = "moe.shizuku.privileged.api"

@Composable
private fun FilterBar(active: Boolean, onOpenFilter: () -> Unit, onSearch: () -> Unit, onExport: () -> Unit, onSettings: () -> Unit) {
    Row(
        Modifier.fillMaxWidth().background(LoggerColors.Panel).padding(horizontal = 12.dp, vertical = 2.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        // Filter icon and status text form one pill that flashes together while held.
        val pillInteraction = remember { MutableInteractionSource() }
        val pressed by pillInteraction.collectIsPressedAsState()
        val scale by animateFloatAsState(if (pressed) 0.95f else 1f, tween(if (pressed) 80 else 120), label = "pillPress")
        val ink = if (pressed) LoggerColors.Bg else LoggerColors.Fg
        Row(
            Modifier
                .graphicsLayer { scaleX = scale; scaleY = scale }
                .clip(RoundedCornerShape(10.dp))
                .background(if (pressed) LoggerColors.Fg else Color.Transparent, RoundedCornerShape(10.dp))
                .clickable(interactionSource = pillInteraction, indication = null, onClick = onOpenFilter)
                .padding(horizontal = 10.dp, vertical = 6.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            Icon(painterResource(R.drawable.ic_filter), stringResource(R.string.action_filter), tint = ink, modifier = Modifier.size(24.dp))
            Text(
                stringResource(if (active) R.string.filter_active else R.string.filter_none),
                color = if (pressed) LoggerColors.Bg else if (active) LoggerColors.Fg else LoggerColors.Dim,
                fontFamily = JetBrainsMono,
                fontWeight = FontWeight.Bold,
                fontSize = 14.sp,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                modifier = Modifier.padding(start = 10.dp),
            )
        }
        // Spacer keeps the three action icons pinned to the right edge while the pill hugs its text.
        Spacer(Modifier.weight(1f))
        IconBtn(R.drawable.ic_search, R.string.action_search, onSearch)
        IconBtn(R.drawable.ic_export, R.string.action_export, onExport)
        IconBtn(R.drawable.ic_settings, R.string.action_settings, onSettings)
    }
}

@Composable
private fun SelectionBar(count: Int, onCopy: () -> Unit, onShare: () -> Unit, onCancel: () -> Unit) {
    Row(
        Modifier.fillMaxWidth().background(LoggerColors.Panel).padding(horizontal = 12.dp, vertical = 2.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Text(
            stringResource(R.string.selected_count, count),
            color = LoggerColors.Fg,
            fontFamily = JetBrainsMono,
            fontWeight = FontWeight.Bold,
            fontSize = 14.sp,
            modifier = Modifier.weight(1f).padding(vertical = 12.dp),
        )
        for ((label, action) in listOf(R.string.copy_entry to onCopy, R.string.share_plain to onShare, R.string.cancel to onCancel)) {
            Text(
                stringResource(label),
                color = LoggerColors.Fg,
                fontFamily = JetBrainsMono,
                fontSize = 13.sp,
                modifier = Modifier.clickable(onClick = action).padding(horizontal = 10.dp, vertical = 12.dp),
            )
        }
    }
}

private fun copyText(context: Context, text: String) {
    context.getSystemService(ClipboardManager::class.java).setPrimaryClip(ClipData.newPlainText("log", text))
    Toast.makeText(context, R.string.copied, Toast.LENGTH_SHORT).show()
}

private fun shareText(context: Context, text: String) {
    val send = Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, text)
    context.startActivity(Intent.createChooser(send, context.getString(R.string.share_plain)))
}

@Composable
private fun SearchField(
    text: String,
    position: Int,
    count: Int,
    onPrev: () -> Unit,
    onNext: () -> Unit,
    onChange: (String) -> Unit,
) {
    val focus = remember { FocusRequester() }
    val keyboard = LocalSoftwareKeyboardController.current
    Row(
        Modifier.padding(start = 16.dp, end = 4.dp, top = 8.dp, bottom = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        LoggerField(
            value = text,
            onValueChange = onChange,
            hint = stringResource(R.string.filter_text_hint),
            modifier = Modifier.weight(1f).focusRequester(focus),
        )
        if (text.isNotBlank()) {
            Text(
                "$position/$count",
                color = LoggerColors.Dim,
                fontFamily = JetBrainsMono,
                fontSize = 12.sp,
                modifier = Modifier.padding(start = 8.dp),
            )
        }
        IconBtn(R.drawable.ic_up, R.string.search_prev, onPrev)
        IconBtn(R.drawable.ic_down, R.string.search_next, onNext)
    }
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

// Record button size; the small buttons are 32dp, so this keeps the same ratio (~0.73).
private val RecordSize = 46.dp

// Green background and black icon while active (e.g. paused) or while pressed.
@Composable
private fun SmallButton(icon: Int, desc: Int, active: Boolean = false, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    val on = active || pressed
    Surface(
        onClick = onClick,
        shape = RoundedCornerShape(12.dp),
        color = if (on) LoggerColors.Fg else LoggerColors.Panel,
        border = BorderStroke(1.dp, if (on) LoggerColors.Fg else LoggerColors.Dim),
        interactionSource = interaction,
        modifier = Modifier.size(32.dp),
    ) {
        Icon(
            painterResource(icon),
            stringResource(desc),
            tint = if (on) LoggerColors.Bg else LoggerColors.Fg,
            modifier = Modifier.padding(6.dp),
        )
    }
}

@Composable
private fun ToggleButton(running: Boolean, onClick: () -> Unit, modifier: Modifier) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    val scale by animateFloatAsState(if (pressed) 0.9f else 1f, tween(if (pressed) 80 else 120), label = "press")
    Surface(
        onClick = onClick,
        shape = RoundedCornerShape(12.dp),
        color = LoggerColors.Fg,
        border = BorderStroke(2.dp, Color.Black),
        interactionSource = interaction,
        modifier = modifier.size(RecordSize).graphicsLayer { scaleX = scale; scaleY = scale },
    ) {
        Icon(
            painterResource(if (running) R.drawable.ic_stop else R.drawable.ic_play),
            stringResource(if (running) R.string.action_stop else R.string.action_start),
            tint = LoggerColors.Panel,
            modifier = Modifier.padding(12.dp),
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
