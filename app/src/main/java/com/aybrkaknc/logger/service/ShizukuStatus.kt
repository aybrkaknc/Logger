package com.aybrkaknc.logger.service

enum class ShizukuStatus {
    NOT_RUNNING, NO_PERMISSION, READY;

    companion object {
        fun current(): ShizukuStatus = when {
            !ShizukuLogcat.isRunning() -> NOT_RUNNING
            ShizukuLogcat.isGranted() -> READY
            else -> NO_PERMISSION
        }
    }
}
