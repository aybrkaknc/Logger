package com.aybrkaknc.logger.ui

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.aybrkaknc.logger.R
import com.aybrkaknc.logger.ui.theme.JetBrainsMono
import com.aybrkaknc.logger.ui.theme.LoggerColors
import com.aybrkaknc.logger.ui.theme.TitleStyle

@Composable
fun IconBtn(@DrawableRes icon: Int, @StringRes desc: Int, onClick: () -> Unit, tint: Color = LoggerColors.Fg) {
    IconButton(onClick = onClick, modifier = Modifier.size(44.dp)) {
        Icon(painterResource(icon), stringResource(desc), tint = tint, modifier = Modifier.size(24.dp))
    }
}

@Composable
fun ScreenHeader(title: String, onBack: () -> Unit) {
    Row(
        Modifier.fillMaxWidth().background(LoggerColors.Panel).statusBarsPadding()
            .padding(horizontal = 8.dp, vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        IconBtn(R.drawable.ic_back, R.string.action_back, onBack)
        Spacer(Modifier.width(8.dp))
        Text(title, style = TitleStyle)
    }
}

@Composable
fun LoggerField(value: String, onValueChange: (String) -> Unit, hint: String, modifier: Modifier = Modifier) {
    BasicTextField(
        value = value,
        onValueChange = onValueChange,
        singleLine = true,
        textStyle = TextStyle(fontFamily = JetBrainsMono, color = LoggerColors.Fg, fontSize = 14.sp),
        cursorBrush = SolidColor(LoggerColors.Fg),
        modifier = modifier.fillMaxWidth(),
        decorationBox = { inner ->
            Box(
                Modifier.fillMaxWidth()
                    .background(LoggerColors.Field, RoundedCornerShape(8.dp))
                    .border(1.dp, LoggerColors.Fg, RoundedCornerShape(8.dp))
                    .padding(horizontal = 12.dp, vertical = 10.dp),
            ) {
                if (value.isEmpty()) Text(hint, color = LoggerColors.Hint, fontFamily = JetBrainsMono, fontSize = 14.sp)
                inner()
            }
        },
    )
}
