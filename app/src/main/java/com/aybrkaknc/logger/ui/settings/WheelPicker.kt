package com.aybrkaknc.logger.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.snapping.rememberSnapFlingBehavior
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.derivedStateOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import kotlin.math.abs
import kotlin.math.max

private val ITEM_HEIGHT = 40.dp

@Composable
fun WheelPicker(items: List<String>, initialIndex: Int, onSelected: (Int) -> Unit) {
    val state = rememberLazyListState(initialIndex)
    val itemPx = with(LocalDensity.current) { ITEM_HEIGHT.toPx() }
    val selected by remember {
        derivedStateOf {
            val i = state.firstVisibleItemIndex + if (state.firstVisibleItemScrollOffset > itemPx / 2) 1 else 0
            i.coerceIn(items.indices)
        }
    }
    LaunchedEffect(selected) { onSelected(selected) }

    Box(Modifier.fillMaxWidth().height(ITEM_HEIGHT * 5)) {
        Box(
            Modifier.align(Alignment.Center).fillMaxWidth().height(ITEM_HEIGHT)
                .background(LoggerColors.Fg.copy(alpha = 0.2f), RoundedCornerShape(12.dp)),
        )
        LazyColumn(
            state = state,
            flingBehavior = rememberSnapFlingBehavior(state),
            contentPadding = PaddingValues(vertical = ITEM_HEIGHT * 2),
            modifier = Modifier.fillMaxSize(),
        ) {
            itemsIndexed(items) { i, label ->
                Box(Modifier.fillMaxWidth().height(ITEM_HEIGHT), contentAlignment = Alignment.Center) {
                    Text(
                        label,
                        color = LoggerColors.Fg,
                        fontFamily = JetBrainsMono,
                        fontWeight = FontWeight.Bold,
                        fontSize = 20.sp,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.alpha(max(0.25f, 1f - 0.4f * abs(i - selected))),
                    )
                }
            }
        }
    }
}
