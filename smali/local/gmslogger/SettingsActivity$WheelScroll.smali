.class Llocal/gmslogger/SettingsActivity$WheelScroll;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnScrollChangeListener;


# instance fields
.field private final h:I

.field private final snap:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/widget/ScrollView;I)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Llocal/gmslogger/SettingsActivity$WheelScroll;->h:I

    new-instance v0, Llocal/gmslogger/SettingsActivity$WheelRun;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, v1, p2}, Llocal/gmslogger/SettingsActivity$WheelRun;-><init>(Landroid/widget/ScrollView;III)V

    iput-object v0, p0, Llocal/gmslogger/SettingsActivity$WheelScroll;->snap:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public onScrollChange(Landroid/view/View;IIII)V
    .locals 4

    check-cast p1, Landroid/widget/ScrollView;

    invoke-virtual {p0, p1}, Llocal/gmslogger/SettingsActivity$WheelScroll;->upd(Landroid/widget/ScrollView;)V

    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$WheelScroll;->snap:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const-wide/16 v1, 0x6e

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method upd(Landroid/widget/ScrollView;)V
    .locals 9

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    invoke-virtual {p1}, Landroid/widget/ScrollView;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    sub-int v5, v2, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Llocal/gmslogger/SettingsActivity$WheelScroll;->h:I

    int-to-float v6, v6

    div-float/2addr v5, v6

    const v6, 0x3ecccccd    # 0.4f

    mul-float/2addr v5, v6

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float/2addr v6, v5

    const/high16 v5, 0x3e800000    # 0.25f

    cmpg-float v7, v6, v5

    if-gez v7, :cond_0

    move v6, v5

    :cond_0
    invoke-virtual {v4, v6}, Landroid/view/View;->setAlpha(F)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
