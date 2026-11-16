.class public Llocal/gmslogger/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"


# static fields
.field private static final BG:I = -0x1000000

.field static final DEFAULT_FONT:I = 0xb

.field static final DEFAULT_MAX_MB:I = 0x400

.field private static final DIM:I = -0xe070e1

.field private static final FG:I = -0xcc00cd

.field static final KEY_FONT:Ljava/lang/String; = "font_sp"

.field static final KEY_MAX_MB:Ljava/lang/String; = "max_mb"

.field private static final PANEL:I = -0xf5f5f6

.field static final PREFS:Ljava/lang/String; = "settings"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private dp(I)I
    .locals 1

    int-to-float p1, p1

    .line 81
    invoke-virtual {p0}, Llocal/gmslogger/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private exportRow(Landroid/widget/LinearLayout;)V
    .locals 4
    .param p1, "parent"    # Landroid/widget/LinearLayout;

    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "export_name"

    const-string v2, "Documents/Logs"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u00c7\u0131kt\u0131 Klas\u00f6r\u00fc"

    new-instance v3, Llocal/gmslogger/SettingsActivity$FolderPicker;

    invoke-direct {v3, p0}, Llocal/gmslogger/SettingsActivity$FolderPicker;-><init>(Llocal/gmslogger/SettingsActivity;)V

    invoke-direct {p0, p1, v2, v1, v3}, Llocal/gmslogger/SettingsActivity;->valueRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private fontRow(Landroid/widget/LinearLayout;)V
    .locals 4
    .param p1, "parent"    # Landroid/widget/LinearLayout;

    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "font_sp"

    const/16 v2, 0xb

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Log yaz\u0131 boyutu (sp)"

    new-instance v3, Llocal/gmslogger/SettingsActivity$FontDialog;

    invoke-direct {v3, p0}, Llocal/gmslogger/SettingsActivity$FontDialog;-><init>(Llocal/gmslogger/SettingsActivity;)V

    invoke-direct {p0, p1, v2, v1, v3}, Llocal/gmslogger/SettingsActivity;->valueRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private maxRow(Landroid/widget/LinearLayout;)V
    .locals 4
    .param p1, "parent"    # Landroid/widget/LinearLayout;

    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "max_mb"

    const/16 v2, 0x400

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    add-int/lit16 v1, v1, 0x200

    div-int/lit16 v1, v1, 0x400

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    move v1, v2

    :cond_0
    const/16 v2, 0xa

    if-le v1, v2, :cond_1

    move v1, v2

    :cond_1
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, " GB"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Maksimum log boyutu"

    new-instance v3, Llocal/gmslogger/SettingsActivity$MaxWheel;

    invoke-direct {v3, p0}, Llocal/gmslogger/SettingsActivity$MaxWheel;-><init>(Llocal/gmslogger/SettingsActivity;)V

    invoke-direct {p0, p1, v2, v1, v3}, Llocal/gmslogger/SettingsActivity;->valueRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private pair(Landroid/view/View;Landroid/view/View;)Landroid/widget/LinearLayout;
    .locals 2
    .param p1, "a"    # Landroid/view/View;
    .param p2, "b"    # Landroid/view/View;

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private settingRow(Landroid/widget/LinearLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 8
    .param p1, "parent"    # Landroid/widget/LinearLayout;
    .param p2, "title"    # Landroid/view/View;
    .param p3, "hint"    # Landroid/view/View;
    .param p4, "control"    # Landroid/view/View;

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v1, 0x10

    invoke-direct {p0, v1}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, 0x0

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v1, -0xddddde

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private text(II)Landroid/widget/TextView;
    .locals 2

    .line 85
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 86
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 87
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/16 p1, 0x18

    const/16 p2, 0x8

    const/4 v1, 0x0

    .line 89
    invoke-virtual {v0, v1, p1, v1, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method private valueRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)V
    .locals 6
    .param p1, "parent"    # Landroid/widget/LinearLayout;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "listener"    # Landroid/view/View$OnClickListener;

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v3, 0x14

    invoke-direct {p0, v3}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setAllCaps(Z)V

    const v3, 0x3da3d70a    # 0.08f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setLetterSpacing(F)V

    const v3, -0x1f1f20

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v5, -0x2

    invoke-direct {v4, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const v3, -0xcc00cd

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v3, 0x6

    invoke-direct {p0, v3}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v3

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v1, -0xddddde

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method dialogTheme()I
    .locals 4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "LoggerDialog"

    const-string v2, "style"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method synthetic lambda$onCreate$0$local-gmslogger-SettingsActivity(Landroid/widget/EditText;Landroid/content/SharedPreferences;Landroid/view/View;)V
    .locals 1

    .line 51
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, -0x1

    :goto_0
    const/16 p3, 0xa

    const/4 v0, 0x0

    if-lt p1, p3, :cond_1

    const/16 p3, 0x5000

    if-le p1, p3, :cond_0

    goto :goto_1

    .line 59
    :cond_0
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p3, "max_mb"

    invoke-interface {p2, p3, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const p1, 0x7f030026

    .line 60
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_1
    :goto_1
    const p1, 0x7f03001b

    .line 56
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$onCreate$1$local-gmslogger-SettingsActivity(Landroid/view/View;)V
    .locals 0

    .line 67
    invoke-virtual {p0}, Llocal/gmslogger/SettingsActivity;->finish()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    const/16 v0, 0x2a

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    const-string v1, "settings"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "export_tree"

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "export_name"

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 30
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 31
    const-string p1, "settings"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Llocal/gmslogger/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 32
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    .line 33
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v2, -0x1000000

    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/16 v2, 0x20

    .line 35
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v2, 0x7f030028

    const v3, -0xcc00cd

    .line 36
    invoke-direct {p0, v2, v3}, Llocal/gmslogger/SettingsActivity;->text(II)Landroid/widget/TextView;

    move-result-object v2

    const/high16 v4, 0x41c00000    # 24.0f

    .line 37
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    const-string v6, "fonts/PixelOperatorMonoHB8.ttf"

    invoke-static {v5, v6}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 38
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 39
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 40
    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setTextColor(I)V

    const v5, -0xf5f5f6

    .line 41
    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setBackgroundColor(I)V

    const/4 v6, 0x2

    .line 42
    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setInputType(I)V

    .line 43
    const-string v6, "max_mb"

    const/16 v7, 0x400

    invoke-interface {p1, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 44
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v7, 0x7f030025

    .line 45
    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(I)V

    .line 46
    invoke-virtual {v6, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 47
    invoke-virtual {v6, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 48
    new-instance v3, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v4, p1}, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda0;-><init>(Llocal/gmslogger/SettingsActivity;Landroid/widget/EditText;Landroid/content/SharedPreferences;)V

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    new-instance p1, Landroid/widget/ImageButton;

    invoke-direct {p1, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    const/high16 v3, 0x7f020000

    .line 63
    invoke-virtual {p1, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 64
    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 65
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v0, 0x8

    .line 66
    invoke-direct {p0, v0}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v0}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v0}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v0}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v0

    invoke-virtual {p1, v3, v5, v7, v0}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 67
    new-instance v0, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Llocal/gmslogger/SettingsActivity$$ExternalSyntheticLambda1;-><init>(Llocal/gmslogger/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    .line 69
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 70
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x2c

    invoke-direct {p0, v5}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v5}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v5

    invoke-direct {v3, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 72
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const p1, 0x7f030021

    const v0, -0xe070e1

    invoke-direct {p0, p1, v0}, Llocal/gmslogger/SettingsActivity;->text(II)Landroid/widget/TextView;

    move-result-object p1

    const v2, 0x7f030020

    invoke-direct {p0, v2, v0}, Llocal/gmslogger/SettingsActivity;->text(II)Landroid/widget/TextView;

    move-result-object v2

    invoke-direct {p0, v1}, Llocal/gmslogger/SettingsActivity;->maxRow(Landroid/widget/LinearLayout;)V

    invoke-direct {p0, v1}, Llocal/gmslogger/SettingsActivity;->fontRow(Landroid/widget/LinearLayout;)V

    invoke-direct {p0, v1}, Llocal/gmslogger/SettingsActivity;->exportRow(Landroid/widget/LinearLayout;)V

    .line 77
    invoke-virtual {p0, v1}, Llocal/gmslogger/SettingsActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method px(I)I
    .locals 1

    invoke-direct {p0, p1}, Llocal/gmslogger/SettingsActivity;->dp(I)I

    move-result v0

    return v0
.end method
