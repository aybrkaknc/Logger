.class Llocal/gmslogger/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Llocal/gmslogger/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Llocal/gmslogger/MainActivity;


# direct methods
.method constructor <init>(Llocal/gmslogger/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 81
    iput-object p1, p0, Llocal/gmslogger/MainActivity$1;->this$0:Llocal/gmslogger/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 84
    iget-object v0, p0, Llocal/gmslogger/MainActivity$1;->this$0:Llocal/gmslogger/MainActivity;

    invoke-static {v0}, Llocal/gmslogger/MainActivity;->access$000(Llocal/gmslogger/MainActivity;)V

    .line 85
    iget-object v0, p0, Llocal/gmslogger/MainActivity$1;->this$0:Llocal/gmslogger/MainActivity;

    invoke-static {v0}, Llocal/gmslogger/MainActivity;->access$100(Llocal/gmslogger/MainActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
