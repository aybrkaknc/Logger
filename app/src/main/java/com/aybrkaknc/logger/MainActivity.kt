package com.aybrkaknc.logger

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.material3.Text
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import com.aybrkaknc.logger.ui.theme.LoggerColors
import com.aybrkaknc.logger.ui.theme.LoggerTheme
import com.aybrkaknc.logger.ui.theme.TitleStyle

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            LoggerTheme {
                Box(
                    Modifier.fillMaxSize().background(LoggerColors.Bg).safeDrawingPadding(),
                    contentAlignment = Alignment.Center,
                ) {
                    Text(stringResource(R.string.title_main), style = TitleStyle)
                }
            }
        }
    }
}
