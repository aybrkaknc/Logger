.class public Llocal/gmslogger/LogService;
.super Landroid/app/Service;
.source "LogService.java"


# static fields
.field static final ACTION_START:Ljava/lang/String; = "local.gmslogger.START"

.field static final ACTION_STOP:Ljava/lang/String; = "local.gmslogger.STOP"

.field static final ALL_FILE:Ljava/lang/String; = "logcat-all.txt"

.field static final FILE:Ljava/lang/String; = "filtered-log.txt"

.field static volatile running:Z


# instance fields
.field private volatile filter:Llocal/gmslogger/LogFilter$Snapshot;

.field private listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private process:Ljava/lang/Process;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000(Llocal/gmslogger/LogService;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Llocal/gmslogger/LogService;->readLog()V

    return-void
.end method

.method private maxBytes()J
    .locals 4

    .line 116
    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Llocal/gmslogger/LogService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "max_mb"

    const/16 v2, 0x400

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x100000

    mul-long v0, v0, v2

    return-wide v0
.end method

.method private readLog()V
    .locals 17

    move-object/from16 v0, p0

    .line 77
    const-string v1, "\n"

    const/4 v2, 0x0

    :try_start_0
    invoke-direct {v0}, Llocal/gmslogger/LogService;->startLogcat()Ljava/lang/Process;

    move-result-object v3

    iput-object v3, v0, Llocal/gmslogger/LogService;->process:Ljava/lang/Process;

    .line 78
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    iget-object v5, v0, Llocal/gmslogger/LogService;->process:Ljava/lang/Process;

    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 79
    new-instance v4, Ljava/io/File;

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Llocal/gmslogger/LogService;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    const-string v7, "filtered-log.txt"

    invoke-direct {v4, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 80
    new-instance v6, Ljava/io/File;

    invoke-virtual {v0, v5}, Llocal/gmslogger/LogService;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    const-string v7, "logcat-all.txt"

    invoke-direct {v6, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 81
    new-instance v5, Ljava/io/FileWriter;

    const/4 v7, 0x1

    invoke-direct {v5, v4, v7}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 82
    new-instance v8, Ljava/io/FileWriter;

    invoke-direct {v8, v6, v7}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    const/4 v9, 0x0

    .line 85
    :cond_0
    :goto_0
    sget-boolean v10, Llocal/gmslogger/LogService;->running:Z

    if-eqz v10, :cond_3

    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 86
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 87
    invoke-virtual {v8}, Ljava/io/FileWriter;->flush()V

    .line 88
    iget-object v11, v0, Llocal/gmslogger/LogService;->filter:Llocal/gmslogger/LogFilter$Snapshot;

    .line 89
    iget-boolean v12, v11, Llocal/gmslogger/LogFilter$Snapshot;->save:Z

    if-eqz v12, :cond_1

    invoke-virtual {v11, v10}, Llocal/gmslogger/LogFilter$Snapshot;->matches(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 90
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v5}, Ljava/io/FileWriter;->flush()V

    :cond_1
    add-int/2addr v9, v7

    .line 93
    rem-int/lit16 v10, v9, 0x1f4

    if-nez v10, :cond_0

    .line 94
    invoke-direct {v0}, Llocal/gmslogger/LogService;->maxBytes()J

    move-result-wide v10

    .line 95
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v12

    const-wide/16 v14, 0x2

    cmp-long v16, v12, v10

    if-lez v16, :cond_2

    .line 96
    invoke-virtual {v8}, Ljava/io/FileWriter;->close()V

    .line 97
    div-long v12, v10, v14

    invoke-static {v6, v12, v13}, Llocal/gmslogger/LogService;->trim(Ljava/io/File;J)V

    .line 98
    new-instance v8, Ljava/io/FileWriter;

    invoke-direct {v8, v6, v7}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 100
    :cond_2
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v12

    cmp-long v16, v12, v10

    if-lez v16, :cond_0

    .line 101
    invoke-virtual {v5}, Ljava/io/FileWriter;->close()V

    .line 102
    div-long/2addr v10, v14

    invoke-static {v4, v10, v11}, Llocal/gmslogger/LogService;->trim(Ljava/io/File;J)V

    .line 103
    new-instance v5, Ljava/io/FileWriter;

    invoke-direct {v5, v4, v7}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    goto :goto_0

    .line 107
    :cond_3
    invoke-virtual {v8}, Ljava/io/FileWriter;->close()V

    .line 108
    invoke-virtual {v5}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :catch_0
    sput-boolean v2, Llocal/gmslogger/LogService;->running:Z

    return-void
.end method

.method private startLogcat()Ljava/lang/Process;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x7

    .line 62
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "logcat"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    const-string v3, "-v"

    aput-object v3, v0, v2

    const/4 v4, 0x2

    const-string v5, "threadtime"

    aput-object v5, v0, v4

    const/4 v5, 0x3

    aput-object v3, v0, v5

    const-string v3, "uid"

    const/4 v6, 0x4

    aput-object v3, v0, v6

    const-string v3, "libc:E"

    const/4 v7, 0x5

    aput-object v3, v0, v7

    const-string v3, "*:V"

    const/4 v7, 0x6

    aput-object v3, v0, v7

    .line 63
    invoke-static {}, Lrikka/shizuku/Shizuku;->pingBinder()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Lrikka/shizuku/Shizuku;->checkSelfPermission()I

    move-result v3

    if-nez v3, :cond_0

    .line 65
    :try_start_0
    const-class v3, Lrikka/shizuku/Shizuku;

    const-string v6, "newProcess"

    new-array v7, v5, [Ljava/lang/Class;

    const-class v8, [Ljava/lang/String;

    aput-object v8, v7, v1

    aput-object v8, v7, v2

    const-class v8, Ljava/lang/String;

    aput-object v8, v7, v4

    invoke-virtual {v3, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 66
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 67
    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v1

    const/4 v1, 0x0

    aput-object v1, v5, v2

    aput-object v1, v5, v4

    invoke-virtual {v3, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 72
    :catch_0
    :cond_0
    new-instance v1, Ljava/lang/ProcessBuilder;

    invoke-direct {v1, v0}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v0

    return-object v0
.end method

.method private stopLogging()V
    .locals 8

    const/4 v0, 0x0

    sput-boolean v0, Llocal/gmslogger/LogService;->running:Z

    iget-object v0, p0, Llocal/gmslogger/LogService;->process:Ljava/lang/Process;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Llocal/gmslogger/LogService;->stopForeground(Z)V

    new-instance v1, Landroid/app/Notification$Builder;

    const-string v2, "gms"

    invoke-direct {v1, p0, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const-string v2, "Logger"

    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    const-string v2, "Log kayd\u0131 durduruldu"

    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "ic_stop"

    const-string v5, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    const-string v3, "notification"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    const/4 v4, 0x2

    invoke-virtual {v3, v4, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    invoke-virtual {p0}, Llocal/gmslogger/LogService;->stopSelf()V

    return-void
.end method

.method private static trim(Ljava/io/File;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".tmp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 122
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p0, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 123
    :try_start_1
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    sub-long/2addr v3, p1

    invoke-virtual {v1, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 124
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    const/high16 p1, 0x10000

    .line 125
    new-array p1, p1, [B

    .line 127
    :goto_0
    invoke-virtual {v1, p1}, Ljava/io/RandomAccessFile;->read([B)I

    move-result p2

    const/4 v3, -0x1

    if-eq p2, v3, :cond_0

    const/4 v3, 0x0

    .line 128
    invoke-virtual {v2, p1, v3, p2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 130
    :cond_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    .line 131
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v0, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_1

    return-void

    .line 132
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "trim failed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    .line 122
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    :try_start_4
    invoke-static {p0, p1}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_1
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p0

    :try_start_5
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p1

    invoke-static {p0, p1}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_2
    goto :goto_4

    :goto_3
    throw p0

    :goto_4
    goto :goto_3
.end method


# virtual methods
.method synthetic lambda$onStartCommand$0$local-gmslogger-LogService(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 49
    new-instance p1, Llocal/gmslogger/LogFilter$Snapshot;

    invoke-direct {p1, p0}, Llocal/gmslogger/LogFilter$Snapshot;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Llocal/gmslogger/LogService;->filter:Llocal/gmslogger/LogFilter$Snapshot;

    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    const/4 v0, 0x0

    .line 147
    sput-boolean v0, Llocal/gmslogger/LogService;->running:Z

    .line 148
    iget-object v0, p0, Llocal/gmslogger/LogService;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    if-eqz v0, :cond_0

    .line 149
    invoke-static {p0}, Llocal/gmslogger/LogFilter;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Llocal/gmslogger/LogService;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 151
    :cond_0
    iget-object v0, p0, Llocal/gmslogger/LogService;->process:Ljava/lang/Process;

    if-eqz v0, :cond_1

    .line 152
    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 154
    :cond_1
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const/4 p2, 0x2

    if-eqz p1, :cond_0

    .line 34
    const-string p3, "local.gmslogger.STOP"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 35
    invoke-direct {p0}, Llocal/gmslogger/LogService;->stopLogging()V

    return p2

    .line 38
    :cond_0
    new-instance p1, Landroid/app/NotificationChannel;

    const p3, 0x7f030023

    invoke-virtual {p0, p3}, Llocal/gmslogger/LogService;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "gms"

    invoke-direct {p1, v1, v0, p2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 39
    const-class v0, Landroid/app/NotificationManager;

    invoke-virtual {p0, v0}, Llocal/gmslogger/LogService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 40
    new-instance p1, Landroid/app/Notification$Builder;

    invoke-direct {p1, p0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0, p3}, Llocal/gmslogger/LogService;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    const p3, 0x7f030022

    .line 42
    invoke-virtual {p0, p3}, Llocal/gmslogger/LogService;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    const p3, 0x108009b

    .line 43
    invoke-virtual {p1, p3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    const/4 p3, 0x1

    .line 45
    invoke-virtual {p0, p3, p1}, Llocal/gmslogger/LogService;->startForeground(ILandroid/app/Notification;)V

    .line 46
    sget-boolean p1, Llocal/gmslogger/LogService;->running:Z

    if-nez p1, :cond_1

    .line 47
    sput-boolean p3, Llocal/gmslogger/LogService;->running:Z

    .line 48
    new-instance p1, Llocal/gmslogger/LogFilter$Snapshot;

    invoke-direct {p1, p0}, Llocal/gmslogger/LogFilter$Snapshot;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Llocal/gmslogger/LogService;->filter:Llocal/gmslogger/LogFilter$Snapshot;

    .line 49
    new-instance p1, Llocal/gmslogger/LogService$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Llocal/gmslogger/LogService$$ExternalSyntheticLambda1;-><init>(Llocal/gmslogger/LogService;)V

    iput-object p1, p0, Llocal/gmslogger/LogService;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 50
    invoke-static {p0}, Llocal/gmslogger/LogFilter;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iget-object p3, p0, Llocal/gmslogger/LogService;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {p1, p3}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 51
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Llocal/gmslogger/LogService$1;

    invoke-direct {p3, p0}, Llocal/gmslogger/LogService$1;-><init>(Llocal/gmslogger/LogService;)V

    invoke-direct {p1, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 56
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_1
    return p2
.end method
