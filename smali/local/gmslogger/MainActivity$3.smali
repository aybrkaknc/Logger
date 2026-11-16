.class Llocal/gmslogger/MainActivity$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Llocal/gmslogger/MainActivity;->animate(Landroid/widget/TextView;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Llocal/gmslogger/MainActivity;

.field final synthetic val$view:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Llocal/gmslogger/MainActivity;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 585
    iput-object p2, p0, Llocal/gmslogger/MainActivity$3;->val$view:Landroid/widget/TextView;

    iput-object p1, p0, Llocal/gmslogger/MainActivity$3;->this$0:Llocal/gmslogger/MainActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 588
    iget-object v0, p0, Llocal/gmslogger/MainActivity$3;->this$0:Llocal/gmslogger/MainActivity;

    invoke-static {v0}, Llocal/gmslogger/MainActivity;->access$200(Llocal/gmslogger/MainActivity;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Llocal/gmslogger/MainActivity$3;->val$view:Landroid/widget/TextView;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method
