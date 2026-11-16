.class Llocal/gmslogger/LogService$1;
.super Ljava/lang/Object;
.source "LogService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Llocal/gmslogger/LogService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Llocal/gmslogger/LogService;


# direct methods
.method constructor <init>(Llocal/gmslogger/LogService;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 51
    iput-object p1, p0, Llocal/gmslogger/LogService$1;->this$0:Llocal/gmslogger/LogService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 54
    iget-object v0, p0, Llocal/gmslogger/LogService$1;->this$0:Llocal/gmslogger/LogService;

    invoke-static {v0}, Llocal/gmslogger/LogService;->access$000(Llocal/gmslogger/LogService;)V

    return-void
.end method
