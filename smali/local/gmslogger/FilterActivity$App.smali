.class final Llocal/gmslogger/FilterActivity$App;
.super Ljava/lang/Object;
.source "FilterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Llocal/gmslogger/FilterActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "App"
.end annotation


# instance fields
.field final label:Ljava/lang/String;

.field final pkg:Ljava/lang/String;

.field final system:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Llocal/gmslogger/FilterActivity$App;->label:Ljava/lang/String;

    .line 43
    iput-object p2, p0, Llocal/gmslogger/FilterActivity$App;->pkg:Ljava/lang/String;

    .line 44
    iput-boolean p3, p0, Llocal/gmslogger/FilterActivity$App;->system:Z

    return-void
.end method
