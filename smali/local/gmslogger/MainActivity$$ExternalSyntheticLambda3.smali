.class public final synthetic Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic f$0:Llocal/gmslogger/MainActivity;

.field public final synthetic f$1:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Llocal/gmslogger/MainActivity;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda3;->f$0:Llocal/gmslogger/MainActivity;

    iput-object p2, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda3;->f$1:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 0
    iget-object v0, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda3;->f$0:Llocal/gmslogger/MainActivity;

    iget-object v1, p0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda3;->f$1:Landroid/widget/TextView;

    invoke-virtual {v0, v1, p1}, Llocal/gmslogger/MainActivity;->lambda$animate$0$local-gmslogger-MainActivity(Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
