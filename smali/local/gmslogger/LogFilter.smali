.class final Llocal/gmslogger/LogFilter;
.super Ljava/lang/Object;
.source "LogFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Llocal/gmslogger/LogFilter$Snapshot;
    }
.end annotation


# static fields
.field static final KEY_LEVELS:Ljava/lang/String; = "levels"

.field static final KEY_PACKAGES:Ljava/lang/String; = "packages"

.field static final KEY_SAVE:Ljava/lang/String; = "save"

.field static final KEY_SYSTEM:Ljava/lang/String; = "system"

.field static final KEY_TEXT:Ljava/lang/String; = "text"

.field static final LEVEL_ERROR:I = 0x1

.field static final LEVEL_INFO:I = 0x4

.field static final LEVEL_WARN:I = 0x2

.field static final PREFS:Ljava/lang/String; = "filter"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static fields(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2

    .line 30
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    const/4 v1, 0x7

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static hidden(Ljava/lang/String;)Z
    .locals 1

    .line 61
    const-string v0, "\tat "

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "getRecentTasks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0

    const/4 p0, 0x1

    return p0
.end method

.method private static isLevel(Ljava/lang/String;)Z
    .locals 2

    .line 34
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-string v0, "VDIWEF"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    return v1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static level(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 38
    invoke-static {p0}, Llocal/gmslogger/LogFilter;->fields(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 39
    array-length v0, p0

    const/4 v1, 0x5

    if-le v0, v1, :cond_0

    aget-object v0, p0, v1

    invoke-static {v0}, Llocal/gmslogger/LogFilter;->isLevel(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    aget-object p0, p0, v1

    return-object p0

    .line 42
    :cond_0
    array-length v0, p0

    const/4 v1, 0x4

    if-le v0, v1, :cond_1

    aget-object v0, p0, v1

    invoke-static {v0}, Llocal/gmslogger/LogFilter;->isLevel(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 43
    aget-object p0, p0, v1

    return-object p0

    .line 45
    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 25
    const-string v0, "filter"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static uid(Ljava/lang/String;)I
    .locals 3

    .line 49
    invoke-static {p0}, Llocal/gmslogger/LogFilter;->fields(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 50
    array-length v0, p0

    const/4 v1, -0x1

    const/4 v2, 0x5

    if-le v0, v2, :cond_0

    aget-object v0, p0, v2

    invoke-static {v0}, Llocal/gmslogger/LogFilter;->isLevel(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    .line 52
    :try_start_0
    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    :cond_0
    return v1
.end method
