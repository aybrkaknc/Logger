.class public final synthetic Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Llocal/gmslogger/SettingsActivity;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Llocal/gmslogger/SettingsActivity;Landroid/widget/EditText;Landroid/content/SharedPreferences;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;->f$0:Llocal/gmslogger/SettingsActivity;

    iput-object p2, p0, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;->f$2:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 0
    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;->f$0:Llocal/gmslogger/SettingsActivity;

    iget-object v1, p0, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;->f$2:Landroid/content/SharedPreferences;

    invoke-virtual {v0, v1, v2, p1}, Llocal/gmslogger/SettingsActivity;->lambda$onCreate$0$local-gmslogger-SettingsActivity(Landroid/widget/EditText;Landroid/content/SharedPreferences;Landroid/view/View;)V

    return-void
.end method
