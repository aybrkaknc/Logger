.class Llocal/gmslogger/FilterActivity$2;
.super Ljava/lang/Object;
.source "FilterActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Llocal/gmslogger/FilterActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Llocal/gmslogger/FilterActivity;


# direct methods
.method constructor <init>(Llocal/gmslogger/FilterActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 142
    iput-object p1, p0, Llocal/gmslogger/FilterActivity$2;->this$0:Llocal/gmslogger/FilterActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 153
    iget-object p1, p0, Llocal/gmslogger/FilterActivity$2;->this$0:Llocal/gmslogger/FilterActivity;

    invoke-static {p1}, Llocal/gmslogger/FilterActivity;->access$000(Llocal/gmslogger/FilterActivity;)V

    .line 154
    iget-object p1, p0, Llocal/gmslogger/FilterActivity$2;->this$0:Llocal/gmslogger/FilterActivity;

    invoke-static {p1}, Llocal/gmslogger/FilterActivity;->access$100(Llocal/gmslogger/FilterActivity;)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
