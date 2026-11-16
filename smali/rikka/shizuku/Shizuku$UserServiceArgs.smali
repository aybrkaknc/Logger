.class public Lrikka/shizuku/Shizuku$UserServiceArgs;
.super Ljava/lang/Object;
.source "Shizuku.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrikka/shizuku/Shizuku;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserServiceArgs"
.end annotation


# instance fields
.field final componentName:Landroid/content/ComponentName;

.field daemon:Z

.field debuggable:Z

.field processName:Ljava/lang/String;

.field tag:Ljava/lang/String;

.field use32BitAppProcess:Z

.field versionCode:I


# direct methods
.method public constructor <init>(Landroid/content/ComponentName;)V
    .locals 2

    .line 589
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 582
    iput v0, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->versionCode:I

    const/4 v1, 0x0

    .line 585
    iput-boolean v1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->debuggable:Z

    .line 586
    iput-boolean v0, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->daemon:Z

    .line 587
    iput-boolean v1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->use32BitAppProcess:Z

    .line 590
    iput-object p1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->componentName:Landroid/content/ComponentName;

    return-void
.end method

.method static synthetic access$1100(Lrikka/shizuku/Shizuku$UserServiceArgs;)Landroid/os/Bundle;
    .locals 0

    .line 579
    invoke-direct {p0}, Lrikka/shizuku/Shizuku$UserServiceArgs;->forAdd()Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lrikka/shizuku/Shizuku$UserServiceArgs;Z)Landroid/os/Bundle;
    .locals 0

    .line 579
    invoke-direct {p0, p1}, Lrikka/shizuku/Shizuku$UserServiceArgs;->forRemove(Z)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method private forAdd()Landroid/os/Bundle;
    .locals 3

    .line 667
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 668
    const-string v1, "shizuku:user-service-arg-component"

    iget-object v2, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 669
    const-string v1, "shizuku:user-service-arg-debuggable"

    iget-boolean v2, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->debuggable:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 670
    const-string v1, "shizuku:user-service-arg-version-code"

    iget v2, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->versionCode:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 671
    const-string v1, "shizuku:user-service-arg-daemon"

    iget-boolean v2, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->daemon:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 672
    const-string v1, "shizuku:user-service-arg-use-32-bit-app-process"

    iget-boolean v2, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->use32BitAppProcess:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 673
    iget-object v1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->processName:Ljava/lang/String;

    const-string v2, "process name suffix must not be null"

    .line 674
    invoke-static {v1, v2}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 673
    const-string v2, "shizuku:user-service-arg-process-name"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    iget-object v1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->tag:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 676
    const-string v2, "shizuku:user-service-arg-tag"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method private forRemove(Z)Landroid/os/Bundle;
    .locals 3

    .line 682
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 683
    const-string v1, "shizuku:user-service-arg-component"

    iget-object v2, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 684
    iget-object v1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->tag:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 685
    const-string v2, "shizuku:user-service-arg-tag"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 687
    :cond_0
    const-string v1, "shizuku:user-service-remove"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method private use32BitAppProcess(Z)Lrikka/shizuku/Shizuku$UserServiceArgs;
    .locals 0

    .line 662
    iput-boolean p1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->use32BitAppProcess:Z

    return-object p0
.end method


# virtual methods
.method public daemon(Z)Lrikka/shizuku/Shizuku$UserServiceArgs;
    .locals 0

    .line 602
    iput-boolean p1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->daemon:Z

    return-object p0
.end method

.method public debuggable(Z)Lrikka/shizuku/Shizuku$UserServiceArgs;
    .locals 0

    .line 636
    iput-boolean p1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->debuggable:Z

    return-object p0
.end method

.method public processNameSuffix(Ljava/lang/String;)Lrikka/shizuku/Shizuku$UserServiceArgs;
    .locals 0

    .line 647
    iput-object p1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->processName:Ljava/lang/String;

    return-object p0
.end method

.method public tag(Ljava/lang/String;)Lrikka/shizuku/Shizuku$UserServiceArgs;
    .locals 0

    .line 614
    iput-object p1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->tag:Ljava/lang/String;

    return-object p0
.end method

.method public version(I)Lrikka/shizuku/Shizuku$UserServiceArgs;
    .locals 0

    .line 626
    iput p1, p0, Lrikka/shizuku/Shizuku$UserServiceArgs;->versionCode:I

    return-object p0
.end method
