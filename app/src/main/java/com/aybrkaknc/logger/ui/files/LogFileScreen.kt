package com.aybrkaknc.logger.ui.files

import android.content.ClipData
import android.content.Context
import android.content.Intent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.log.LogDescriber
import com.aybrkaknc.logger.log.LogEntry
import com.aybrkaknc.logger.log.LogFileItem
import com.aybrkaknc.logger.log.LogFiles
import com.aybrkaknc.logger.log.LogFilter
import com.aybrkaknc.logger.settings.Prefs
import com.aybrkaknc.logger.ui.IconBtn
import com.aybrkaknc.logger.ui.LoggerField
import com.aybrkaknc.logger.ui.main.LogRow
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

private class Loaded(val entries: List<LogEntry>, val big: Boolean)

// Read-only view of one exported log. Same rows as the live screen; search and the saved filters apply.
@Composable
fun LogFileScreen(item: LogFileItem, onBack: () -> Unit) {
    val context = LocalContext.current
    val prefs = remember { Prefs(context) }
    val describer = remember { LogDescriber(context) }
    var query by rememberSaveable { mutableStateOf("") }
    var loaded by remember { mutableStateOf<Loaded?>(null) }

    LaunchedEffect(item.uri) {
        loaded = withContext(Dispatchers.IO) {
            val (lines, big) = LogFiles.readNewestFirst(context, item)
            Loaded(lines.map { describer.describe(it) }, big)
        }
    }

    val q = query.trim()
    val filter = remember { LogFilter.from(context, prefs) }
    val shown = loaded?.entries?.filter { e ->
        filter.matches(e.raw) && (q.isEmpty() || e.raw.contains(q, ignoreCase = true))
    }.orEmpty()

    Column(Modifier.fillMaxSize().background(LoggerColors.Bg)) {
        Row(
            Modifier.fillMaxWidth().statusBarsPadding().padding(horizontal = 8.dp, vertical = 8.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            IconBtn(R.drawable.ic_back, R.string.action_back, onBack)
            Spacer(Modifier.width(8.dp))
            Text(
                item.name,
                color = LoggerColors.Fg,
                fontFamily = JetBrainsMono,
                fontWeight = FontWeight.Bold,
                fontSize = 13.sp,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                modifier = Modifier.weight(1f),
            )
            IconBtn(R.drawable.ic_export, R.string.action_share, onClick = { share(context, item) })
        }
        LoggerField(
            query,
            { query = it },
            stringResource(R.string.filter_text_hint),
            Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
        )
        if (loaded?.big == true) {
            Text(
                stringResource(R.string.file_big_notice),
                color = LoggerColors.Yellow,
                fontFamily = JetBrainsMono,
                fontSize = 11.sp,
                modifier = Modifier.padding(horizontal = 16.dp),
            )
        }
        LazyColumn(
            Modifier.fillMaxSize(),
            contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 8.dp, bottom = 24.dp),
            verticalArrangement = Arrangement.Top,
        ) {
            items(shown) { e ->
                LogRow(entry = e, fontSp = prefs.fontSp, query = q, current = false)
            }
        }
    }
}

private fun share(context: Context, item: LogFileItem) {
    val send = Intent(Intent.ACTION_SEND).setType("text/plain")
        .putExtra(Intent.EXTRA_STREAM, item.uri)
        .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
    send.clipData = ClipData.newUri(context.contentResolver, item.name, item.uri)
    context.startActivity(Intent.createChooser(send, context.getString(R.string.action_share)))
}
