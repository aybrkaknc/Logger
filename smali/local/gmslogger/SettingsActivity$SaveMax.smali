.class Llocal/gmslogger/SettingsActivity$SaveMax;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final field:Landroid/widget/EditText;

.field final synthetic this$0:Llocal/gmslogger/SettingsActivity;


# direct methods
.method constructor <init>(Llocal/gmslogger/SettingsActivity;Landroid/widget/EditText;)V
    .locals 0

    iput-object p1, p0, Llocal/gmslogger/SettingsActivity$SaveMax;->this$0:Llocal/gmslogger/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Llocal/gmslogger/SettingsActivity$SaveMax;->field:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$SaveMax;->field:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v1, -0x1

    :goto_0
    const/16 v2, 0xa

    if-lt v1, v2, :cond_0

    const/16 v2, 0x1400

    if-gt v1, v2, :cond_0

    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$SaveMax;->this$0:Llocal/gmslogger/SettingsActivity;

    const-string v2, "settings"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "max_mb"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$SaveMax;->this$0:Llocal/gmslogger/SettingsActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->recreate()V

    return-void

    :cond_0
    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$SaveMax;->this$0:Llocal/gmslogger/SettingsActivity;

    const-string v2, "10 ile 5120 aras\u0131nda bir de\u011fer girin"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
