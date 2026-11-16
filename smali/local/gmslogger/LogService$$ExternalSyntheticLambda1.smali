.class public final synthetic Llocal/gmslogger/LogService$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field public final synthetic f$0:Llocal/gmslogger/LogService;


# direct methods
.method public synthetic constructor <init>(Llocal/gmslogger/LogService;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llocal/gmslogger/LogService$$ExternalSyntheticLambda1;->f$0:Llocal/gmslogger/LogService;

    return-void
.end method


# virtual methods
.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 1

    .line 0
    iget-object v0, p0, Llocal/gmslogger/LogService$$ExternalSyntheticLambda1;->f$0:Llocal/gmslogger/LogService;

    invoke-virtual {v0, p1, p2}, Llocal/gmslogger/LogService;->lambda$onStartCommand$0$local-gmslogger-LogService(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void
.end method
