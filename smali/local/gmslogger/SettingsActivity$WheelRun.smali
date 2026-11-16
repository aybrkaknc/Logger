.class Llocal/gmslogger/SettingsActivity$WheelRun;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final h:I

.field private final mode:I

.field private final sv:Landroid/widget/ScrollView;

.field private final y:I


# direct methods
.method constructor <init>(Landroid/widget/ScrollView;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->sv:Landroid/widget/ScrollView;

    iput p2, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->mode:I

    iput p3, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->y:I

    iput p4, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->h:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->sv:Landroid/widget/ScrollView;

    iget v1, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->mode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget v1, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->y:I

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void

    :cond_0
    iget v1, p0, Llocal/gmslogger/SettingsActivity$WheelRun;->h:I

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    div-int/lit8 v3, v1, 0x2

    add-int/2addr v3, v2

    div-int/2addr v3, v1

    mul-int/2addr v3, v1

    if-eq v2, v3, :cond_1

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    :cond_1
    return-void
.end method
