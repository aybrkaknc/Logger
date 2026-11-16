.class public Lrikka/shizuku/Shizuku;
.super Ljava/lang/Object;
.source "Shizuku.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrikka/shizuku/Shizuku$OnBinderReceivedListener;,
        Lrikka/shizuku/Shizuku$ListenerHolder;,
        Lrikka/shizuku/Shizuku$OnBinderDeadListener;,
        Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;,
        Lrikka/shizuku/Shizuku$UserServiceArgs;
    }
.end annotation


# static fields
.field private static final DEAD_LISTENERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lrikka/shizuku/Shizuku$ListenerHolder<",
            "Lrikka/shizuku/Shizuku$OnBinderDeadListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final DEATH_RECIPIENT:Landroid/os/IBinder$DeathRecipient;

.field private static final MAIN_HANDLER:Landroid/os/Handler;

.field private static final PERMISSION_LISTENERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lrikka/shizuku/Shizuku$ListenerHolder<",
            "Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final RECEIVED_LISTENERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lrikka/shizuku/Shizuku$ListenerHolder<",
            "Lrikka/shizuku/Shizuku$OnBinderReceivedListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final SHIZUKU_APPLICATION:Lmoe/shizuku/server/IShizukuApplication;

.field private static binder:Landroid/os/IBinder; = null

.field private static binderReady:Z = false

.field private static permissionGranted:Z = false

.field private static preV11:Z = false

.field private static serverApiVersion:I = -0x1

.field private static serverContext:Ljava/lang/String; = null

.field private static serverPatchVersion:I = -0x1

.field private static serverUid:I = -0x1

.field private static service:Lmoe/shizuku/server/IShizukuService;

.field private static shouldShowRequestPermissionRationale:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 50
    new-instance v0, Lrikka/shizuku/Shizuku$1;

    invoke-direct {v0}, Lrikka/shizuku/Shizuku$1;-><init>()V

    sput-object v0, Lrikka/shizuku/Shizuku;->SHIZUKU_APPLICATION:Lmoe/shizuku/server/IShizukuApplication;

    .line 76
    new-instance v0, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda4;-><init>()V

    sput-object v0, Lrikka/shizuku/Shizuku;->DEATH_RECIPIENT:Landroid/os/IBinder$DeathRecipient;

    .line 209
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    .line 210
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lrikka/shizuku/Shizuku;->DEAD_LISTENERS:Ljava/util/List;

    .line 211
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lrikka/shizuku/Shizuku;->PERMISSION_LISTENERS:Ljava/util/List;

    .line 212
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lrikka/shizuku/Shizuku;->MAIN_HANDLER:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(I)I
    .locals 0

    .line 36
    sput p0, Lrikka/shizuku/Shizuku;->serverUid:I

    return p0
.end method

.method static synthetic access$102(I)I
    .locals 0

    .line 36
    sput p0, Lrikka/shizuku/Shizuku;->serverApiVersion:I

    return p0
.end method

.method static synthetic access$202(I)I
    .locals 0

    .line 36
    sput p0, Lrikka/shizuku/Shizuku;->serverPatchVersion:I

    return p0
.end method

.method static synthetic access$302(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 36
    sput-object p0, Lrikka/shizuku/Shizuku;->serverContext:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$402(Z)Z
    .locals 0

    .line 36
    sput-boolean p0, Lrikka/shizuku/Shizuku;->permissionGranted:Z

    return p0
.end method

.method static synthetic access$502(Z)Z
    .locals 0

    .line 36
    sput-boolean p0, Lrikka/shizuku/Shizuku;->shouldShowRequestPermissionRationale:Z

    return p0
.end method

.method static synthetic access$600()V
    .locals 0

    .line 36
    invoke-static {}, Lrikka/shizuku/Shizuku;->scheduleBinderReceivedListeners()V

    return-void
.end method

.method static synthetic access$700(II)V
    .locals 0

    .line 36
    invoke-static {p0, p1}, Lrikka/shizuku/Shizuku;->scheduleRequestPermissionResultListener(II)V

    return-void
.end method

.method public static addBinderDeadListener(Lrikka/shizuku/Shizuku$OnBinderDeadListener;)V
    .locals 1

    const/4 v0, 0x0

    .line 329
    invoke-static {p0, v0}, Lrikka/shizuku/Shizuku;->addBinderDeadListener(Lrikka/shizuku/Shizuku$OnBinderDeadListener;Landroid/os/Handler;)V

    return-void
.end method

.method public static addBinderDeadListener(Lrikka/shizuku/Shizuku$OnBinderDeadListener;Landroid/os/Handler;)V
    .locals 4

    .line 339
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 340
    :try_start_0
    sget-object v1, Lrikka/shizuku/Shizuku;->DEAD_LISTENERS:Ljava/util/List;

    new-instance v2, Lrikka/shizuku/Shizuku$ListenerHolder;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lrikka/shizuku/Shizuku$ListenerHolder;-><init>(Ljava/lang/Object;Landroid/os/Handler;Lrikka/shizuku/Shizuku$1;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static addBinderReceivedListener(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)V
    .locals 1

    const/4 v0, 0x0

    .line 230
    invoke-static {p0, v0}, Lrikka/shizuku/Shizuku;->addBinderReceivedListener(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;Landroid/os/Handler;)V

    return-void
.end method

.method public static addBinderReceivedListener(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;Landroid/os/Handler;)V
    .locals 1

    .line 249
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v0, p0

    check-cast v0, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lrikka/shizuku/Shizuku;->addBinderReceivedListener(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;ZLandroid/os/Handler;)V

    return-void
.end method

.method private static addBinderReceivedListener(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;ZLandroid/os/Handler;)V
    .locals 2

    if-eqz p1, :cond_2

    .line 274
    sget-boolean p1, Lrikka/shizuku/Shizuku;->binderReady:Z

    if-eqz p1, :cond_2

    if-eqz p2, :cond_0

    .line 276
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;-><init>(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)V

    invoke-virtual {p2, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 277
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-ne p1, v0, :cond_1

    .line 278
    invoke-interface {p0}, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;->onBinderReceived()V

    goto :goto_0

    .line 280
    :cond_1
    sget-object p1, Lrikka/shizuku/Shizuku;->MAIN_HANDLER:Landroid/os/Handler;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;-><init>(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 283
    :cond_2
    :goto_0
    sget-object p1, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter p1

    .line 284
    :try_start_0
    new-instance v0, Lrikka/shizuku/Shizuku$ListenerHolder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lrikka/shizuku/Shizuku$ListenerHolder;-><init>(Ljava/lang/Object;Landroid/os/Handler;Lrikka/shizuku/Shizuku$1;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static addBinderReceivedListenerSticky(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)V
    .locals 1

    .line 259
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v0, p0

    check-cast v0, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lrikka/shizuku/Shizuku;->addBinderReceivedListenerSticky(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;Landroid/os/Handler;)V

    return-void
.end method

.method public static addBinderReceivedListenerSticky(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;Landroid/os/Handler;)V
    .locals 1

    .line 270
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v0, p0

    check-cast v0, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;

    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lrikka/shizuku/Shizuku;->addBinderReceivedListener(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;ZLandroid/os/Handler;)V

    return-void
.end method

.method public static addRequestPermissionResultListener(Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;)V
    .locals 1

    const/4 v0, 0x0

    .line 384
    invoke-static {p0, v0}, Lrikka/shizuku/Shizuku;->addRequestPermissionResultListener(Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;Landroid/os/Handler;)V

    return-void
.end method

.method public static addRequestPermissionResultListener(Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;Landroid/os/Handler;)V
    .locals 4

    .line 394
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 395
    :try_start_0
    sget-object v1, Lrikka/shizuku/Shizuku;->PERMISSION_LISTENERS:Ljava/util/List;

    new-instance v2, Lrikka/shizuku/Shizuku$ListenerHolder;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lrikka/shizuku/Shizuku$ListenerHolder;-><init>(Ljava/lang/Object;Landroid/os/Handler;Lrikka/shizuku/Shizuku$1;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 396
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private static attachApplicationV11(Landroid/os/IBinder;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 108
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 109
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 111
    :try_start_0
    const-string v2, "moe.shizuku.server.IShizukuService"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 112
    sget-object v2, Lrikka/shizuku/Shizuku;->SHIZUKU_APPLICATION:Lmoe/shizuku/server/IShizukuApplication;

    invoke-interface {v2}, Lmoe/shizuku/server/IShizukuApplication;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 113
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/16 p1, 0xe

    const/4 v2, 0x0

    .line 114
    invoke-interface {p0, p1, v0, v1, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    .line 115
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 118
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return p0

    :catchall_0
    move-exception p0

    .line 117
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 118
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 119
    throw p0
.end method

.method private static attachApplicationV13(Landroid/os/IBinder;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 85
    const-string v1, "shizuku:attach-api-version"

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 86
    const-string v1, "shizuku:attach-package-name"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object p1

    .line 89
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 91
    :try_start_0
    const-string v2, "moe.shizuku.server.IShizukuService"

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 92
    sget-object v2, Lrikka/shizuku/Shizuku;->SHIZUKU_APPLICATION:Lmoe/shizuku/server/IShizukuApplication;

    invoke-interface {v2}, Lmoe/shizuku/server/IShizukuApplication;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    const/4 v2, 0x1

    .line 93
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v2, 0x0

    .line 94
    invoke-virtual {v0, p1, v2}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    const/16 v0, 0x12

    .line 95
    invoke-interface {p0, v0, p1, v1, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    .line 96
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    return p0

    :catchall_0
    move-exception p0

    .line 98
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 100
    throw p0
.end method

.method public static attachUserService(Landroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 1

    .line 905
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lmoe/shizuku/server/IShizukuService;->attachUserService(Landroid/os/IBinder;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 907
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static bindUserService(Lrikka/shizuku/Shizuku$UserServiceArgs;Landroid/content/ServiceConnection;)V
    .locals 1

    .line 731
    invoke-static {p0}, Lrikka/shizuku/ShizukuServiceConnections;->get(Lrikka/shizuku/Shizuku$UserServiceArgs;)Lrikka/shizuku/ShizukuServiceConnection;

    move-result-object v0

    .line 732
    invoke-virtual {v0, p1}, Lrikka/shizuku/ShizukuServiceConnection;->addConnection(Landroid/content/ServiceConnection;)V

    .line 734
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object p1

    invoke-static {p0}, Lrikka/shizuku/Shizuku$UserServiceArgs;->access$1100(Lrikka/shizuku/Shizuku$UserServiceArgs;)Landroid/os/Bundle;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Lmoe/shizuku/server/IShizukuService;->addUserService(Lmoe/shizuku/server/IShizukuServiceConnection;Landroid/os/Bundle;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 736
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static checkRemotePermission(Ljava/lang/String;)I
    .locals 1

    .line 830
    sget v0, Lrikka/shizuku/Shizuku;->serverUid:I

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 832
    :cond_0
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0, p0}, Lmoe/shizuku/server/IShizukuService;->checkPermission(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 834
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static checkSelfPermission()I
    .locals 2

    .line 866
    sget-boolean v0, Lrikka/shizuku/Shizuku;->permissionGranted:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 868
    :cond_0
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0}, Lmoe/shizuku/server/IShizukuService;->checkSelfPermission()Z

    move-result v0

    sput-boolean v0, Lrikka/shizuku/Shizuku;->permissionGranted:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    const/4 v0, -0x1

    return v0

    :catch_0
    move-exception v0

    .line 870
    invoke-static {v0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static dispatchPermissionConfirmationResult(IIILandroid/os/Bundle;)V
    .locals 1

    .line 914
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2, p3}, Lmoe/shizuku/server/IShizukuService;->dispatchPermissionConfirmationResult(IIILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 916
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static exit()V
    .locals 1

    .line 896
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0}, Lmoe/shizuku/server/IShizukuService;->exit()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 898
    invoke-static {v0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static getBinder()Landroid/os/IBinder;
    .locals 1

    .line 442
    sget-object v0, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    return-object v0
.end method

.method public static getFlagsForUid(II)I
    .locals 1

    .line 923
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lmoe/shizuku/server/IShizukuService;->getFlagsForUid(II)I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 925
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static getLatestServiceVersion()I
    .locals 1

    const/16 v0, 0xd

    return v0
.end method

.method public static getSELinuxContext()Ljava/lang/String;
    .locals 1

    .line 567
    sget-object v0, Lrikka/shizuku/Shizuku;->serverContext:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 569
    :cond_0
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0}, Lmoe/shizuku/server/IShizukuService;->getSELinuxContext()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lrikka/shizuku/Shizuku;->serverContext:Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const/4 v0, 0x0

    return-object v0

    :catch_1
    move-exception v0

    .line 571
    invoke-static {v0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static getServerPatchVersion()I
    .locals 1

    .line 940
    sget v0, Lrikka/shizuku/Shizuku;->serverPatchVersion:I

    return v0
.end method

.method public static getUid()I
    .locals 2

    .line 506
    sget v0, Lrikka/shizuku/Shizuku;->serverUid:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 508
    :cond_0
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0}, Lmoe/shizuku/server/IShizukuService;->getUid()I

    move-result v0

    sput v0, Lrikka/shizuku/Shizuku;->serverUid:I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    return v1

    :catch_1
    move-exception v0

    .line 510
    invoke-static {v0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static getVersion()I
    .locals 2

    .line 524
    sget v0, Lrikka/shizuku/Shizuku;->serverApiVersion:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 526
    :cond_0
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0}, Lmoe/shizuku/server/IShizukuService;->getVersion()I

    move-result v0

    sput v0, Lrikka/shizuku/Shizuku;->serverApiVersion:I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    return v1

    :catch_1
    move-exception v0

    .line 528
    invoke-static {v0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static isPreV11()Z
    .locals 1

    .line 542
    sget-boolean v0, Lrikka/shizuku/Shizuku;->preV11:Z

    return v0
.end method

.method static synthetic lambda$removeBinderDeadListener$2(Lrikka/shizuku/Shizuku$OnBinderDeadListener;Lrikka/shizuku/Shizuku$ListenerHolder;)Z
    .locals 0

    .line 352
    invoke-static {p1}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$removeBinderReceivedListener$1(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;Lrikka/shizuku/Shizuku$ListenerHolder;)Z
    .locals 0

    .line 297
    invoke-static {p1}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$removeRequestPermissionResultListener$3(Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;Lrikka/shizuku/Shizuku$ListenerHolder;)Z
    .locals 0

    .line 407
    invoke-static {p1}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$scheduleRequestPermissionResultListener$4(Lrikka/shizuku/Shizuku$ListenerHolder;II)V
    .locals 0

    .line 415
    invoke-static {p0}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;

    invoke-interface {p0, p1, p2}, Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;->onRequestPermissionResult(II)V

    return-void
.end method

.method static synthetic lambda$scheduleRequestPermissionResultListener$5(Lrikka/shizuku/Shizuku$ListenerHolder;II)V
    .locals 0

    .line 420
    invoke-static {p0}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;

    invoke-interface {p0, p1, p2}, Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;->onRequestPermissionResult(II)V

    return-void
.end method

.method static synthetic lambda$static$0()V
    .locals 1

    const/4 v0, 0x0

    .line 77
    sput-boolean v0, Lrikka/shizuku/Shizuku;->binderReady:Z

    const/4 v0, 0x0

    .line 78
    invoke-static {v0, v0}, Lrikka/shizuku/Shizuku;->onBinderReceived(Landroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method

.method private static newProcess([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lrikka/shizuku/ShizukuRemoteProcess;
    .locals 2

    .line 493
    :try_start_0
    new-instance v0, Lrikka/shizuku/ShizukuRemoteProcess;

    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v1

    invoke-interface {v1, p0, p1, p2}, Lmoe/shizuku/server/IShizukuService;->newProcess([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lmoe/shizuku/server/IRemoteProcess;

    move-result-object p0

    invoke-direct {v0, p0}, Lrikka/shizuku/ShizukuRemoteProcess;-><init>(Lmoe/shizuku/server/IRemoteProcess;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    .line 495
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static onBinderReceived(Landroid/os/IBinder;Ljava/lang/String;)V
    .locals 5

    .line 126
    const-string v0, "attachApplication"

    const-string v1, "ShizukuApplication"

    sget-object v2, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    if-ne v2, p0, :cond_0

    goto :goto_2

    :cond_0
    if-nez p0, :cond_1

    const/4 p0, 0x0

    .line 129
    sput-object p0, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    .line 130
    sput-object p0, Lrikka/shizuku/Shizuku;->service:Lmoe/shizuku/server/IShizukuService;

    const/4 p1, -0x1

    .line 131
    sput p1, Lrikka/shizuku/Shizuku;->serverUid:I

    .line 132
    sput p1, Lrikka/shizuku/Shizuku;->serverApiVersion:I

    .line 133
    sput-object p0, Lrikka/shizuku/Shizuku;->serverContext:Ljava/lang/String;

    .line 135
    invoke-static {}, Lrikka/shizuku/Shizuku;->scheduleBinderDeadListeners()V

    return-void

    :cond_1
    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 138
    sget-object v4, Lrikka/shizuku/Shizuku;->DEATH_RECIPIENT:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {v2, v4, v3}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 140
    :cond_2
    sput-object p0, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    .line 141
    invoke-static {p0}, Lmoe/shizuku/server/IShizukuService$Stub;->asInterface(Landroid/os/IBinder;)Lmoe/shizuku/server/IShizukuService;

    move-result-object p0

    sput-object p0, Lrikka/shizuku/Shizuku;->service:Lmoe/shizuku/server/IShizukuService;

    .line 144
    :try_start_0
    sget-object p0, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    sget-object v2, Lrikka/shizuku/Shizuku;->DEATH_RECIPIENT:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {p0, v2, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 146
    :catchall_0
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 p0, 0x1

    .line 150
    :try_start_1
    sget-object v2, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    invoke-static {v2, p1}, Lrikka/shizuku/Shizuku;->attachApplicationV13(Landroid/os/IBinder;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    invoke-static {v2, p1}, Lrikka/shizuku/Shizuku;->attachApplicationV11(Landroid/os/IBinder;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 151
    sput-boolean p0, Lrikka/shizuku/Shizuku;->preV11:Z

    .line 153
    :cond_3
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    .line 155
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :goto_1
    sget-boolean p1, Lrikka/shizuku/Shizuku;->preV11:Z

    if-eqz p1, :cond_4

    .line 159
    sput-boolean p0, Lrikka/shizuku/Shizuku;->binderReady:Z

    .line 160
    invoke-static {}, Lrikka/shizuku/Shizuku;->scheduleBinderReceivedListeners()V

    :cond_4
    :goto_2
    return-void
.end method

.method public static peekUserService(Lrikka/shizuku/Shizuku$UserServiceArgs;Landroid/content/ServiceConnection;)I
    .locals 2

    .line 750
    invoke-static {p0}, Lrikka/shizuku/ShizukuServiceConnections;->get(Lrikka/shizuku/Shizuku$UserServiceArgs;)Lrikka/shizuku/ShizukuServiceConnection;

    move-result-object v0

    .line 751
    invoke-virtual {v0, p1}, Lrikka/shizuku/ShizukuServiceConnection;->addConnection(Landroid/content/ServiceConnection;)V

    .line 754
    :try_start_0
    invoke-static {p0}, Lrikka/shizuku/Shizuku$UserServiceArgs;->access$1100(Lrikka/shizuku/Shizuku$UserServiceArgs;)Landroid/os/Bundle;

    move-result-object p0

    .line 755
    const-string p1, "shizuku:user-service-arg-no-create"

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 756
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object p1

    invoke-interface {p1, v0, p0}, Lmoe/shizuku/server/IShizukuService;->addUserService(Lmoe/shizuku/server/IShizukuServiceConnection;Landroid/os/Bundle;)I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 761
    invoke-static {}, Lrikka/shizuku/Shizuku;->isPreV11()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Lrikka/shizuku/Shizuku;->getVersion()I

    move-result p1

    const/16 v0, 0xd

    if-lt p1, v0, :cond_0

    return p0

    :cond_0
    if-nez p0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0

    :catch_0
    move-exception p0

    .line 758
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static pingBinder()Z
    .locals 1

    .line 455
    sget-object v0, Lrikka/shizuku/Shizuku;->binder:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/os/IBinder;->pingBinder()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static removeBinderDeadListener(Lrikka/shizuku/Shizuku$OnBinderDeadListener;)Z
    .locals 3

    .line 351
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 352
    :try_start_0
    sget-object v1, Lrikka/shizuku/Shizuku;->DEAD_LISTENERS:Ljava/util/List;

    new-instance v2, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda3;-><init>(Lrikka/shizuku/Shizuku$OnBinderDeadListener;)V

    invoke-interface {v1, v2}, Ljava/util/List;->removeIf(Ljava/util/function/Predicate;)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 353
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static removeBinderReceivedListener(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)Z
    .locals 2

    .line 296
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 297
    :try_start_0
    new-instance v1, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda7;-><init>(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)V

    invoke-interface {v0, v1}, Ljava/util/List;->removeIf(Ljava/util/function/Predicate;)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 298
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static removeRequestPermissionResultListener(Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;)Z
    .locals 3

    .line 406
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 407
    :try_start_0
    sget-object v1, Lrikka/shizuku/Shizuku;->PERMISSION_LISTENERS:Ljava/util/List;

    new-instance v2, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda6;-><init>(Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;)V

    invoke-interface {v1, v2}, Ljava/util/List;->removeIf(Ljava/util/function/Predicate;)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 408
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static requestPermission(I)V
    .locals 1

    .line 852
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0, p0}, Lmoe/shizuku/server/IShizukuService;->requestPermission(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 854
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method protected static requireService()Lmoe/shizuku/server/IShizukuService;
    .locals 2

    .line 429
    sget-object v0, Lrikka/shizuku/Shizuku;->service:Lmoe/shizuku/server/IShizukuService;

    if-eqz v0, :cond_0

    return-object v0

    .line 430
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "binder haven\'t been received"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;
    .locals 1

    .line 459
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method private static scheduleBinderDeadListeners()V
    .locals 5

    .line 357
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 358
    :try_start_0
    sget-object v1, Lrikka/shizuku/Shizuku;->DEAD_LISTENERS:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$ListenerHolder;

    .line 359
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$900(Lrikka/shizuku/Shizuku$ListenerHolder;)Landroid/os/Handler;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 360
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$900(Lrikka/shizuku/Shizuku$ListenerHolder;)Landroid/os/Handler;

    move-result-object v3

    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$OnBinderDeadListener;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda5;

    invoke-direct {v4, v2}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda5;-><init>(Lrikka/shizuku/Shizuku$OnBinderDeadListener;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 362
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    if-ne v3, v4, :cond_1

    .line 363
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$OnBinderDeadListener;

    invoke-interface {v2}, Lrikka/shizuku/Shizuku$OnBinderDeadListener;->onBinderDead()V

    goto :goto_0

    .line 365
    :cond_1
    sget-object v3, Lrikka/shizuku/Shizuku;->MAIN_HANDLER:Landroid/os/Handler;

    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$OnBinderDeadListener;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda5;

    invoke-direct {v4, v2}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda5;-><init>(Lrikka/shizuku/Shizuku$OnBinderDeadListener;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 370
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method private static scheduleBinderReceivedListeners()V
    .locals 5

    .line 302
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 303
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$ListenerHolder;

    .line 304
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$900(Lrikka/shizuku/Shizuku$ListenerHolder;)Landroid/os/Handler;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 305
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$900(Lrikka/shizuku/Shizuku$ListenerHolder;)Landroid/os/Handler;

    move-result-object v3

    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;

    invoke-direct {v4, v2}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;-><init>(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 307
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    if-ne v3, v4, :cond_1

    .line 308
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;

    invoke-interface {v2}, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;->onBinderReceived()V

    goto :goto_0

    .line 310
    :cond_1
    sget-object v3, Lrikka/shizuku/Shizuku;->MAIN_HANDLER:Landroid/os/Handler;

    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$OnBinderReceivedListener;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;

    invoke-direct {v4, v2}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda0;-><init>(Lrikka/shizuku/Shizuku$OnBinderReceivedListener;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 314
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    .line 315
    sput-boolean v0, Lrikka/shizuku/Shizuku;->binderReady:Z

    return-void

    :catchall_0
    move-exception v1

    .line 314
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method private static scheduleRequestPermissionResultListener(II)V
    .locals 5

    .line 412
    sget-object v0, Lrikka/shizuku/Shizuku;->RECEIVED_LISTENERS:Ljava/util/List;

    monitor-enter v0

    .line 413
    :try_start_0
    sget-object v1, Lrikka/shizuku/Shizuku;->PERMISSION_LISTENERS:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$ListenerHolder;

    .line 414
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$900(Lrikka/shizuku/Shizuku$ListenerHolder;)Landroid/os/Handler;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 415
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$900(Lrikka/shizuku/Shizuku$ListenerHolder;)Landroid/os/Handler;

    move-result-object v3

    new-instance v4, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda1;

    invoke-direct {v4, v2, p0, p1}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda1;-><init>(Lrikka/shizuku/Shizuku$ListenerHolder;II)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 417
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    if-ne v3, v4, :cond_1

    .line 418
    invoke-static {v2}, Lrikka/shizuku/Shizuku$ListenerHolder;->access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;

    invoke-interface {v2, p0, p1}, Lrikka/shizuku/Shizuku$OnRequestPermissionResultListener;->onRequestPermissionResult(II)V

    goto :goto_0

    .line 420
    :cond_1
    sget-object v3, Lrikka/shizuku/Shizuku;->MAIN_HANDLER:Landroid/os/Handler;

    new-instance v4, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda2;

    invoke-direct {v4, v2, p0, p1}, Lrikka/shizuku/Shizuku$$ExternalSyntheticLambda2;-><init>(Lrikka/shizuku/Shizuku$ListenerHolder;II)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 424
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw p0

    :goto_2
    goto :goto_1
.end method

.method public static shouldShowRequestPermissionRationale()Z
    .locals 1

    .line 881
    sget-boolean v0, Lrikka/shizuku/Shizuku;->permissionGranted:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 882
    :cond_0
    sget-boolean v0, Lrikka/shizuku/Shizuku;->shouldShowRequestPermissionRationale:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    .line 884
    :cond_1
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0}, Lmoe/shizuku/server/IShizukuService;->shouldShowRequestPermissionRationale()Z

    move-result v0

    sput-boolean v0, Lrikka/shizuku/Shizuku;->shouldShowRequestPermissionRationale:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 886
    invoke-static {v0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static transactRemote(Landroid/os/Parcel;Landroid/os/Parcel;I)V
    .locals 2

    .line 471
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0}, Lmoe/shizuku/server/IShizukuService;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1, p0, p1, p2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 473
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static unbindUserService(Lrikka/shizuku/Shizuku$UserServiceArgs;Landroid/content/ServiceConnection;Z)V
    .locals 1

    if-eqz p2, :cond_0

    .line 786
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p2}, Lrikka/shizuku/Shizuku$UserServiceArgs;->access$1200(Lrikka/shizuku/Shizuku$UserServiceArgs;Z)Landroid/os/Bundle;

    move-result-object p0

    const/4 p2, 0x0

    invoke-interface {p1, p2, p0}, Lmoe/shizuku/server/IShizukuService;->removeUserService(Lmoe/shizuku/server/IShizukuServiceConnection;Landroid/os/Bundle;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 788
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 800
    :cond_0
    invoke-static {p0}, Lrikka/shizuku/ShizukuServiceConnections;->get(Lrikka/shizuku/Shizuku$UserServiceArgs;)Lrikka/shizuku/ShizukuServiceConnection;

    move-result-object p1

    .line 807
    invoke-static {}, Lrikka/shizuku/Shizuku;->getVersion()I

    move-result p2

    const/16 v0, 0xe

    if-ge p2, v0, :cond_1

    invoke-static {}, Lrikka/shizuku/Shizuku;->getVersion()I

    move-result p2

    const/16 v0, 0xd

    if-ne p2, v0, :cond_2

    invoke-static {}, Lrikka/shizuku/Shizuku;->getServerPatchVersion()I

    move-result p2

    const/4 v0, 0x4

    if-lt p2, v0, :cond_2

    .line 809
    :cond_1
    :try_start_1
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lrikka/shizuku/Shizuku$UserServiceArgs;->access$1200(Lrikka/shizuku/Shizuku$UserServiceArgs;Z)Landroid/os/Bundle;

    move-result-object p0

    invoke-interface {p2, p1, p0}, Lmoe/shizuku/server/IShizukuService;->removeUserService(Lmoe/shizuku/server/IShizukuServiceConnection;Landroid/os/Bundle;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 818
    :cond_2
    invoke-virtual {p1}, Lrikka/shizuku/ShizukuServiceConnection;->clearConnections()V

    .line 819
    invoke-static {p1}, Lrikka/shizuku/ShizukuServiceConnections;->remove(Lrikka/shizuku/ShizukuServiceConnection;)V

    return-void

    :catch_1
    move-exception p0

    .line 811
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static updateFlagsForUid(III)V
    .locals 1

    .line 932
    :try_start_0
    invoke-static {}, Lrikka/shizuku/Shizuku;->requireService()Lmoe/shizuku/server/IShizukuService;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lmoe/shizuku/server/IShizukuService;->updateFlagsForUid(III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 934
    invoke-static {p0}, Lrikka/shizuku/Shizuku;->rethrowAsRuntimeException(Landroid/os/RemoteException;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method
