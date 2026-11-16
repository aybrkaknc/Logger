.class Llocal/gmslogger/SettingsActivity$SaveMaxWheel;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final h:I

.field private final sv:Landroid/widget/ScrollView;

.field final synthetic this$0:Llocal/gmslogger/SettingsActivity;


# direct methods
.method constructor <init>(Llocal/gmslogger/SettingsActivity;Landroid/widget/ScrollView;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;->this$0:Llocal/gmslogger/SettingsActivity;

    iput-object p2, p0, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;->sv:Landroid/widget/ScrollView;

    iput p3, p0, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;->h:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;->sv:Landroid/widget/ScrollView;

    iget v1, p0, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;->h:I

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    div-int/lit8 v3, v1, 0x2

    add-int/2addr v2, v3

    div-int/2addr v2, v1

    add-int/lit8 v2, v2, 0x1

    const/16 v3, 0x1

    if-ge v2, v3, :cond_0

    move v2, v3

    :cond_0
    const/16 v3, 0xa

    if-le v2, v3, :cond_1

    move v2, v3

    :cond_1
    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;->this$0:Llocal/gmslogger/SettingsActivity;

    const-string v3, "settings"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "max_mb"

    mul-int/lit16 v2, v2, 0x400

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v0}, Landroid/app/Activity;->recreate()V

    return-void
.end method
