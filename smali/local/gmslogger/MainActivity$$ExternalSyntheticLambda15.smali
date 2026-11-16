.class public final synthetic Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic f$0:Llocal/gmslogger/MainActivity;

.field public final synthetic f$1:Ljava/lang/Runnable;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Llocal/gmslogger/MainActivity;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;->f$0:Llocal/gmslogger/MainActivity;

    iput-object p2, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;->f$1:Ljava/lang/Runnable;

    iput-object p3, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 0
    iget-object v0, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;->f$0:Llocal/gmslogger/MainActivity;

    iget-object v1, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;->f$1:Ljava/lang/Runnable;

    iget-object v2, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;->f$2:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1, p2}, Llocal/gmslogger/MainActivity;->lambda$entry$1$local-gmslogger-MainActivity(Ljava/lang/Runnable;Ljava/lang/String;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
