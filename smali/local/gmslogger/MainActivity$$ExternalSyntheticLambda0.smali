.class public final synthetic Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Llocal/gmslogger/MainActivity;

.field public final synthetic f$1:Llocal/gmslogger/LogFilter$Snapshot;

.field public final synthetic f$2:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Llocal/gmslogger/MainActivity;Llocal/gmslogger/LogFilter$Snapshot;Ljava/util/List;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;->f$0:Llocal/gmslogger/MainActivity;

    iput-object p2, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;->f$1:Llocal/gmslogger/LogFilter$Snapshot;

    iput-object p3, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;->f$2:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;->f$0:Llocal/gmslogger/MainActivity;

    iget-object v1, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;->f$1:Llocal/gmslogger/LogFilter$Snapshot;

    iget-object v2, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;->f$2:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Llocal/gmslogger/MainActivity;->lambda$updateView$2$local-gmslogger-MainActivity(Llocal/gmslogger/LogFilter$Snapshot;Ljava/util/List;)V

    return-void
.end method
