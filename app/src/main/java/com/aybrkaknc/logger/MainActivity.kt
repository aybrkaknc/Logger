package com.aybrkaknc.logger

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.BackHandler
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import com.aybrkaknc.logger.service.LogService
import com.aybrkaknc.logger.service.ShizukuLogcat
import com.aybrkaknc.logger.service.ShizukuStatus
import com.aybrkaknc.logger.ui.filter.FilterScreen
import com.aybrkaknc.logger.ui.main.MainScreen
import com.aybrkaknc.logger.ui.settings.SettingsScreen
import com.aybrkaknc.logger.ui.theme.LoggerTheme
import rikka.shizuku.Shizuku

private enum class Screen { Main, Filter, Settings }

class MainActivity : ComponentActivity() {
    private var shizuku by mutableStateOf(ShizukuStatus.NOT_RUNNING)
    private var startAfterGrant = false

    private val notificationPermission = registerForActivityResult(ActivityResultContracts.RequestPermission()) {}

    private val binderReceived = Shizuku.OnBinderReceivedListener { shizuku = ShizukuStatus.current() }
    private val binderDead = Shizuku.OnBinderDeadListener { shizuku = ShizukuStatus.current() }
    private val permissionResult = Shizuku.OnRequestPermissionResultListener { _, result ->
        shizuku = ShizukuStatus.current()
        if (result == PackageManager.PERMISSION_GRANTED && startAfterGrant) LogService.start(this)
        startAfterGrant = false
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        Shizuku.addBinderReceivedListenerSticky(binderReceived)
        Shizuku.addBinderDeadListener(binderDead)
        Shizuku.addRequestPermissionResultListener(permissionResult)

        if (savedInstanceState == null && Build.VERSION.SDK_INT >= 33 &&
            checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED
        ) {
            notificationPermission.launch(Manifest.permission.POST_NOTIFICATIONS)
        }

        setContent {
            LoggerTheme {
                var screen by rememberSaveable { mutableStateOf(Screen.Main) }
                BackHandler(enabled = screen != Screen.Main) { screen = Screen.Main }
                when (screen) {
                    Screen.Main -> MainScreen(
                        shizuku = shizuku,
                        onToggle = ::toggleRecording,
                        onOpenFilter = { screen = Screen.Filter },
                        onOpenSettings = { screen = Screen.Settings },
                    )
                    Screen.Filter -> FilterScreen(onBack = { screen = Screen.Main })
                    Screen.Settings -> SettingsScreen(onBack = { screen = Screen.Main })
                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        shizuku = ShizukuStatus.current()
    }

    override fun onDestroy() {
        Shizuku.removeBinderReceivedListener(binderReceived)
        Shizuku.removeBinderDeadListener(binderDead)
        Shizuku.removeRequestPermissionResultListener(permissionResult)
        super.onDestroy()
    }

    private fun toggleRecording() {
        if (LogService.running.value) {
            LogService.stop(this)
            return
        }
        shizuku = ShizukuStatus.current()
        when (shizuku) {
            ShizukuStatus.READY -> LogService.start(this)
            ShizukuStatus.NO_PERMISSION -> {
                startAfterGrant = true
                Shizuku.requestPermission(ShizukuLogcat.PERMISSION_REQUEST)
            }
            ShizukuStatus.NOT_RUNNING -> Toast.makeText(this, R.string.shizuku_not_running, Toast.LENGTH_LONG).show()
        }
    }
}
