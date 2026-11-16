.class Llocal/gmslogger/SettingsActivity$FolderPicker;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$0:Llocal/gmslogger/SettingsActivity;


# direct methods
.method constructor <init>(Llocal/gmslogger/SettingsActivity;)V
    .locals 0

    iput-object p1, p0, Llocal/gmslogger/SettingsActivity$FolderPicker;->this$0:Llocal/gmslogger/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Llocal/gmslogger/SettingsActivity$FolderPicker;->this$0:Llocal/gmslogger/SettingsActivity;

    const/16 p1, 0x2a

    invoke-virtual {v1, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
