package com.aybrkaknc.logger.service;

interface ILogcatService {
    // Shizuku calls this transaction code to tear the user service down.
    void destroy() = 16777114;

    ParcelFileDescriptor start(in String[] args) = 1;

    void stop() = 2;
}
