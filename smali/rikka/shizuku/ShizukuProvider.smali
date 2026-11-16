.class public Lrikka/shizuku/ShizukuProvider;
.super Landroid/content/ContentProvider;
.source "ShizukuProvider.java"


# static fields
.field public static final ACTION_BINDER_RECEIVED:Ljava/lang/String; = "moe.shizuku.api.action.BINDER_RECEIVED"

.field private static final EXTRA_BINDER:Ljava/lang/String; = "moe.shizuku.privileged.api.intent.extra.BINDER"

.field public static final MANAGER_APPLICATION_ID:Ljava/lang/String; = "moe.shizuku.privileged.api"

.field public static final METHOD_GET_BINDER:Ljava/lang/String; = "getBinder"

.field public static final METHOD_SEND_BINDER:Ljava/lang/String; = "sendBinder"

.field public static final PERMISSION:Ljava/lang/String; = "moe.shizuku.manager.permission.API_V23"

.field private static final TAG:Ljava/lang/String; = "ShizukuProvider"

.field private static enableMultiProcess:Z = false

.field private static enableSuiInitialization:Z = true

.field private static isProviderProcess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method public static disableAutomaticSuiInitialization()V
    .locals 1

    const/4 v0, 0x0

    .line 107
    sput-boolean v0, Lrikka/shizuku/ShizukuProvider;->enableSuiInitialization:Z

    return-void
.end method

.method public static enableMultiProcessSupport(Z)V
    .locals 2

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Enable built-in multi-process support (from "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p0, :cond_0

    const-string v1, "provider process"

    goto :goto_0

    :cond_0
    const-string v1, "non-provider process"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ShizukuProvider"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    sput-boolean p0, Lrikka/shizuku/ShizukuProvider;->isProviderProcess:Z

    const/4 p0, 0x1

    .line 100
    sput-boolean p0, Lrikka/shizuku/ShizukuProvider;->enableMultiProcess:Z

    return-void
.end method

.method private handleGetBinder(Landroid/os/Bundle;)Z
    .locals 2

    .line 235
    invoke-static {}, Lrikka/shizuku/Shizuku;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 236
    invoke-interface {v0}, Landroid/os/IBinder;->pingBinder()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 239
    :cond_0
    new-instance v1, Lmoe/shizuku/api/BinderContainer;

    invoke-direct {v1, v0}, Lmoe/shizuku/api/BinderContainer;-><init>(Landroid/os/IBinder;)V

    const-string v0, "moe.shizuku.privileged.api.intent.extra.BINDER"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private handleSendBinder(Landroid/os/Bundle;)V
    .locals 4

    .line 211
    invoke-static {}, Lrikka/shizuku/Shizuku;->pingBinder()Z

    move-result v0

    const-string v1, "ShizukuProvider"

    if-eqz v0, :cond_0

    .line 212
    const-string p1, "sendBinder is called when already a living binder"

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 216
    :cond_0
    const-string v0, "moe.shizuku.privileged.api.intent.extra.BINDER"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lmoe/shizuku/api/BinderContainer;

    if-eqz p1, :cond_1

    .line 217
    iget-object v2, p1, Lmoe/shizuku/api/BinderContainer;->binder:Landroid/os/IBinder;

    if-eqz v2, :cond_1

    .line 218
    const-string v2, "binder received"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    iget-object v2, p1, Lmoe/shizuku/api/BinderContainer;->binder:Landroid/os/IBinder;

    invoke-virtual {p0}, Lrikka/shizuku/ShizukuProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lrikka/shizuku/Shizuku;->onBinderReceived(Landroid/os/IBinder;Ljava/lang/String;)V

    .line 222
    sget-boolean v2, Lrikka/shizuku/ShizukuProvider;->enableMultiProcess:Z

    if-eqz v2, :cond_1

    .line 223
    const-string v2, "broadcast binder"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    new-instance v1, Landroid/content/Intent;

    const-string v2, "moe.shizuku.api.action.BINDER_RECEIVED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 226
    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p1

    .line 227
    invoke-virtual {p0}, Lrikka/shizuku/ShizukuProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 228
    invoke-virtual {p0}, Lrikka/shizuku/ShizukuProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public static requestBinderForNonProviderProcess(Landroid/content/Context;)V
    .locals 6

    const-string v0, "content://"

    .line 116
    sget-boolean v1, Lrikka/shizuku/ShizukuProvider;->isProviderProcess:Z

    if-eqz v1, :cond_0

    goto/16 :goto_2

    .line 120
    :cond_0
    const-string v1, "request binder in non-provider process"

    const-string v2, "ShizukuProvider"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    new-instance v1, Lrikka/shizuku/ShizukuProvider$1;

    invoke-direct {v1}, Lrikka/shizuku/ShizukuProvider$1;-><init>()V

    .line 133
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x21

    const-string v5, "moe.shizuku.api.action.BINDER_RECEIVED"

    if-lt v3, v4, :cond_1

    .line 134
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x4

    invoke-virtual {p0, v1, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_0

    .line 136
    :cond_1
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :goto_0
    const/4 v1, 0x0

    .line 141
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".shizuku"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v4, "getBinder"

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v3, v0, v4, v1, v5}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    nop

    :goto_1
    if-eqz v1, :cond_2

    .line 148
    const-class v0, Lmoe/shizuku/api/BinderContainer;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 150
    const-string v0, "moe.shizuku.privileged.api.intent.extra.BINDER"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lmoe/shizuku/api/BinderContainer;

    if-eqz v0, :cond_2

    .line 151
    iget-object v1, v0, Lmoe/shizuku/api/BinderContainer;->binder:Landroid/os/IBinder;

    if-eqz v1, :cond_2

    .line 152
    const-string v1, "Binder received from other process"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    iget-object v0, v0, Lmoe/shizuku/api/BinderContainer;->binder:Landroid/os/IBinder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lrikka/shizuku/Shizuku;->onBinderReceived(Landroid/os/IBinder;Ljava/lang/String;)V

    :cond_2
    :goto_2
    return-void
.end method

.method public static setIsProviderProcess(Z)V
    .locals 0

    .line 88
    sput-boolean p0, Lrikka/shizuku/ShizukuProvider;->isProviderProcess:Z

    return-void
.end method


# virtual methods
.method public attachInfo(Landroid/content/Context;Landroid/content/pm/ProviderInfo;)V
    .locals 0

    .line 160
    invoke-super {p0, p1, p2}, Landroid/content/ContentProvider;->attachInfo(Landroid/content/Context;Landroid/content/pm/ProviderInfo;)V

    .line 162
    iget-boolean p1, p2, Landroid/content/pm/ProviderInfo;->multiprocess:Z

    if-nez p1, :cond_1

    .line 165
    iget-boolean p1, p2, Landroid/content/pm/ProviderInfo;->exported:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 168
    sput-boolean p1, Lrikka/shizuku/ShizukuProvider;->isProviderProcess:Z

    return-void

    .line 166
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "android:exported must be true"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 163
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "android:multiprocess must be false"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 2

    .line 183
    invoke-static {}, Lrikka/sui/Sui;->isSui()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 184
    const-string p1, "ShizukuProvider"

    const-string p2, "Provider called when Sui is available. Are you using Shizuku and Sui at the same time?"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    return-object p1

    :cond_0
    const/4 p2, 0x0

    if-nez p3, :cond_1

    return-object p2

    .line 192
    :cond_1
    const-class v0, Lmoe/shizuku/api/BinderContainer;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 194
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 195
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    const-string v1, "sendBinder"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string p3, "getBinder"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 201
    :cond_2
    invoke-direct {p0, v0}, Lrikka/shizuku/ShizukuProvider;->handleGetBinder(Landroid/os/Bundle;)Z

    move-result p1

    if-nez p1, :cond_3

    return-object p2

    :cond_3
    :goto_0
    return-object v0

    .line 197
    :cond_4
    invoke-direct {p0, p3}, Lrikka/shizuku/ShizukuProvider;->handleSendBinder(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public final delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public final getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()Z
    .locals 3

    .line 173
    sget-boolean v0, Lrikka/shizuku/ShizukuProvider;->enableSuiInitialization:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lrikka/sui/Sui;->isSui()Z

    move-result v0

    if-nez v0, :cond_0

    .line 174
    invoke-virtual {p0}, Lrikka/shizuku/ShizukuProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrikka/sui/Sui;->init(Ljava/lang/String;)Z

    move-result v0

    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Initialize Sui: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ShizukuProvider"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public final query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
