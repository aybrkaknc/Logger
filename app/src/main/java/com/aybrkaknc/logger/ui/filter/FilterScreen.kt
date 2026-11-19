package com.aybrkaknc.logger.ui.filter

import android.content.pm.ApplicationInfo
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ColumnScope
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.produceState
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.ImageBitmap
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.core.graphics.drawable.toBitmap
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.log.LogLine
import com.aybrkaknc.logger.settings.Prefs
import com.aybrkaknc.logger.ui.LoggerField
import com.aybrkaknc.logger.ui.ScreenHeader
import com.aybrkaknc.logger.ui.pulseGlow
import com.aybrkaknc.logger.ui.recordGlow
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import com.aybrkaknc.logger.ui.theme.PixelCutShape
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.Locale

private class AppInfo(val pkg: String, val label: String, val system: Boolean)

@Composable
fun FilterScreen(onBack: () -> Unit) {
    val context = LocalContext.current
    val prefs = remember { Prefs(context) }
    var packages by remember { mutableStateOf(prefs.packages) }
    var levels by remember { mutableIntStateOf(prefs.levels) }
    var showSystem by remember { mutableStateOf(prefs.showSystem) }
    var tags by remember { mutableStateOf(prefs.tags) }
    var pids by remember { mutableStateOf(prefs.pids) }
    var query by rememberSaveable { mutableStateOf("") }
    // Edits stay in state until Apply writes them to prefs.
    val savedPackages = remember { prefs.packages }
    val savedLevels = remember { prefs.levels }
    val savedShowSystem = remember { prefs.showSystem }
    val savedTags = remember { prefs.tags }
    val savedPids = remember { prefs.pids }
    val changed = packages != savedPackages || levels != savedLevels || showSystem != savedShowSystem ||
        tags != savedTags || pids != savedPids

    val apps by produceState(emptyList<AppInfo>()) {
        value = withContext(Dispatchers.IO) {
            val pm = context.packageManager
            pm.getInstalledApplications(0).map {
                val system = it.flags and (ApplicationInfo.FLAG_SYSTEM or ApplicationInfo.FLAG_UPDATED_SYSTEM_APP) != 0
                AppInfo(it.packageName, pm.getApplicationLabel(it).toString(), system)
            }.sortedBy { it.label.lowercase(Locale.ROOT) }
        }
    }

    val q = query.trim().lowercase(Locale.ROOT)
    val selected = apps.filter { it.pkg in packages }
    val others = apps.filter {
        it.pkg !in packages && (!it.system || showSystem) &&
            (q.isEmpty() || it.label.lowercase(Locale.ROOT).contains(q) || it.pkg.contains(q))
    }

    fun togglePackage(pkg: String) {
        packages = if (pkg in packages) packages - pkg else packages + pkg
    }

    Box(Modifier.fillMaxSize().background(LoggerColors.Bg)) {
    Column(Modifier.fillMaxSize()) {
        ScreenHeader(stringResource(R.string.filter_title), onBack) {
            Text(
                stringResource(R.string.filter_clear),
                color = LoggerColors.Fg,
                fontFamily = JetBrainsMono,
                fontWeight = FontWeight.Bold,
                fontSize = 13.sp,
                modifier = Modifier.clickable {
                    packages = emptySet()
                    levels = LogLine.ALL
                    tags = ""
                    pids = ""
                    showSystem = false
                    query = ""
                }.padding(horizontal = 8.dp, vertical = 8.dp),
            )
        }
        Column(Modifier.fillMaxSize().navigationBarsPadding()) {
            FilterBox {
                    FilterCaption(stringResource(R.string.filter_group_level))
                    Row(Modifier.padding(horizontal = 12.dp), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        for ((bit, label) in listOf(LogLine.ERROR to R.string.lvl_error, LogLine.WARN to R.string.lvl_warn, LogLine.INFO to R.string.lvl_info)) {
                            LevelChip(stringResource(label), levels and bit != 0, Modifier.weight(1f)) {
                                levels = levels xor bit
                            }
                        }
                    }
                    FilterCaption(stringResource(R.string.filter_group_tag))
                    LoggerField(
                        tags,
                        { tags = it },
                        stringResource(R.string.filter_tags_hint),
                        Modifier.padding(start = 12.dp, end = 12.dp, top = 4.dp),
                    )
                    FilterCaption(stringResource(R.string.filter_group_pid))
                    LoggerField(
                        pids,
                        { pids = it },
                        stringResource(R.string.filter_pids_hint),
                        Modifier.padding(start = 12.dp, end = 12.dp, top = 4.dp),
                    )
                }
            FilterBox(Modifier.weight(1f)) {
                FilterCaption(stringResource(R.string.filter_group_app))
                LoggerField(query, { query = it }, stringResource(R.string.filter_app_search), Modifier.padding(12.dp, 4.dp))
                CheckRow(stringResource(R.string.filter_show_system), showSystem) {
                    showSystem = !showSystem
                }
                LazyColumn(Modifier.weight(1f), contentPadding = PaddingValues(bottom = 72.dp)) {
                    item { Section(stringResource(R.string.filter_selected, selected.size)) }
                    items(selected, key = { "s:" + it.pkg }) { AppRow(it, true) { togglePackage(it.pkg) } }
                    item { Section(stringResource(R.string.filter_all_apps)) }
                    items(others, key = { "a:" + it.pkg }) { AppRow(it, false) { togglePackage(it.pkg) } }
                }
            }
        }
    }
    if (changed) {
        val glow = pulseGlow(false)
        Box(
            Modifier.align(Alignment.BottomEnd).navigationBarsPadding().padding(16.dp)
                .recordGlow(glow, 12.dp)
                .clip(RoundedCornerShape(12.dp))
                .background(LoggerColors.Fg, RoundedCornerShape(12.dp))
                .clickable {
                    prefs.packages = packages
                    prefs.levels = levels
                    prefs.showSystem = showSystem
                    prefs.tags = tags
                    prefs.pids = pids
                    onBack()
                }
                .padding(horizontal = 24.dp, vertical = 12.dp),
        ) {
            Text(stringResource(R.string.filter_apply), color = LoggerColors.Bg, fontFamily = JetBrainsMono, fontWeight = FontWeight.Bold, fontSize = 13.sp)
        }
    }
    }
}

@Composable
private fun LevelChip(label: String, on: Boolean, modifier: Modifier, onClick: () -> Unit) {
    val shape = RoundedCornerShape(14.dp)
    Box(
        modifier.clip(shape)
            .border(1.dp, if (on) LoggerColors.Fg else LoggerColors.Dim, shape)
            .background(if (on) LoggerColors.Fg else LoggerColors.Bg)
            .clickable(onClick = onClick)
            .padding(vertical = 8.dp),
        contentAlignment = Alignment.Center,
    ) {
        Text(
            label,
            color = if (on) LoggerColors.Bg else LoggerColors.Dim,
            fontFamily = JetBrainsMono,
            fontWeight = if (on) FontWeight.Bold else FontWeight.Normal,
            fontSize = 12.sp,
        )
    }
}

@Composable
private fun CheckBoxMark(on: Boolean) {
    val shape = RoundedCornerShape(3.dp)
    Box(
        Modifier.size(18.dp).border(1.5.dp, LoggerColors.Fg, shape).background(if (on) LoggerColors.Fg else LoggerColors.Bg, shape),
        contentAlignment = Alignment.Center,
    ) {
        if (on) Text("✓", color = LoggerColors.Bg, fontSize = 12.sp, fontWeight = FontWeight.Bold)
    }
}

@Composable
private fun CheckRow(label: String, on: Boolean, onClick: () -> Unit) {
    Row(
        Modifier.fillMaxWidth().clickable(onClick = onClick).padding(horizontal = 12.dp, vertical = 4.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        CheckBoxMark(on)
        Spacer(Modifier.width(12.dp))
        Text(label, color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontSize = 13.sp)
    }
}

// Pixel-cut Panel card with a Dim border. Holds one or more captioned sections split by FilterDivider.
@Composable
private fun FilterBox(modifier: Modifier = Modifier, content: @Composable ColumnScope.() -> Unit) {
    val shape = PixelCutShape(4.dp)
    Column(
        modifier.fillMaxWidth()
            .padding(horizontal = 12.dp, vertical = 6.dp)
            .clip(shape)
            .background(LoggerColors.Panel, shape)
            .border(1.dp, LoggerColors.Dim, shape)
            .padding(bottom = 14.dp),
    ) {
        content()
    }
}

@Composable
private fun FilterGroup(title: String, content: @Composable () -> Unit) {
    FilterBox {
        FilterCaption(title)
        content()
    }
}

@Composable
private fun FilterCaption(title: String) {
    Text(
        title,
        color = LoggerColors.Dim,
        fontFamily = JetBrainsMono,
        fontSize = 11.sp,
        letterSpacing = 1.sp,
        modifier = Modifier.padding(start = 12.dp, top = 8.dp, bottom = 4.dp),
    )
}


@Composable
private fun Section(title: String) {
    Text(
        title,
        color = LoggerColors.Dim,
        fontFamily = JetBrainsMono,
        fontSize = 11.sp,
        letterSpacing = 1.sp,
        modifier = Modifier.padding(start = 16.dp, top = 12.dp, bottom = 4.dp),
    )
}

@Composable
private fun AppRow(app: AppInfo, checked: Boolean, onClick: () -> Unit) {
    val context = LocalContext.current
    val icon by produceState<ImageBitmap?>(null, app.pkg) {
        value = withContext(Dispatchers.IO) {
            runCatching { context.packageManager.getApplicationIcon(app.pkg).toBitmap(72, 72).asImageBitmap() }.getOrNull()
        }
    }
    Row(
        Modifier.fillMaxWidth().clickable(onClick = onClick).padding(horizontal = 16.dp, vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Box(Modifier.size(28.dp).clip(RoundedCornerShape(6.dp)).background(LoggerColors.Panel)) {
            icon?.let { Image(it, null, Modifier.size(28.dp)) }
        }
        Spacer(Modifier.width(12.dp))
        Column(Modifier.weight(1f)) {
            Text(app.label, color = LoggerColors.Fg, fontFamily = JetBrainsMono, fontSize = 13.sp)
            Text(app.pkg, color = LoggerColors.Dim, fontFamily = JetBrainsMono, fontSize = 10.sp)
        }
        CheckBoxMark(checked)
    }
}
