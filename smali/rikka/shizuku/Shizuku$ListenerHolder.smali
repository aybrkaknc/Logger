.class Lrikka/shizuku/Shizuku$ListenerHolder;
.super Ljava/lang/Object;
.source "Shizuku.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrikka/shizuku/Shizuku;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ListenerHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final listener:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Object;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    iput-object p1, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->listener:Ljava/lang/Object;

    .line 192
    iput-object p2, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->handler:Landroid/os/Handler;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Landroid/os/Handler;Lrikka/shizuku/Shizuku$1;)V
    .locals 0

    .line 185
    invoke-direct {p0, p1, p2}, Lrikka/shizuku/Shizuku$ListenerHolder;-><init>(Ljava/lang/Object;Landroid/os/Handler;)V

    return-void
.end method

.method static synthetic access$1000(Lrikka/shizuku/Shizuku$ListenerHolder;)Ljava/lang/Object;
    .locals 0

    .line 185
    iget-object p0, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->listener:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$900(Lrikka/shizuku/Shizuku$ListenerHolder;)Landroid/os/Handler;
    .locals 0

    .line 185
    iget-object p0, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->handler:Landroid/os/Handler;

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_2

    .line 198
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 199
    :cond_1
    check-cast p1, Lrikka/shizuku/Shizuku$ListenerHolder;

    .line 200
    iget-object v2, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->listener:Ljava/lang/Object;

    iget-object v3, p1, Lrikka/shizuku/Shizuku$ListenerHolder;->listener:Ljava/lang/Object;

    invoke-static {v2, v3}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->handler:Landroid/os/Handler;

    iget-object p1, p1, Lrikka/shizuku/Shizuku$ListenerHolder;->handler:Landroid/os/Handler;

    invoke-static {v2, p1}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 205
    iget-object v0, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->listener:Ljava/lang/Object;

    iget-object v1, p0, Lrikka/shizuku/Shizuku$ListenerHolder;->handler:Landroid/os/Handler;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
