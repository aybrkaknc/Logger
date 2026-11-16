.class Llocal/gmslogger/SettingsActivity$MaxWheel;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$0:Llocal/gmslogger/SettingsActivity;


# direct methods
.method constructor <init>(Llocal/gmslogger/SettingsActivity;)V
    .locals 0

    iput-object p1, p0, Llocal/gmslogger/SettingsActivity$MaxWheel;->this$0:Llocal/gmslogger/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 12

    iget-object v0, p0, Llocal/gmslogger/SettingsActivity$MaxWheel;->this$0:Llocal/gmslogger/SettingsActivity;

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Llocal/gmslogger/SettingsActivity;->px(I)I

    move-result v1

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    mul-int/lit8 v4, v1, 0x2

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v4, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/16 v5, 0x1

    :goto_0
    const/16 v6, 0xb

    if-ge v5, v6, :cond_0

    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, " GB"

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v8, 0x41b00000    # 22.0f

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v8, 0x11

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setGravity(I)V

    const v8, -0xcc00cd

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v8, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    const/4 v9, 0x1

    invoke-static {v8, v9}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    invoke-direct {v8, v9, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setVerticalFadingEdgeEnabled(Z)V

    invoke-virtual {v3, v1}, Landroid/widget/ScrollView;->setFadingEdgeLength(I)V

    const v4, -0xf5f5f6

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setOverScrollMode(I)V

    new-instance v4, Llocal/gmslogger/SettingsActivity$WheelScroll;

    invoke-direct {v4, v3, v1}, Llocal/gmslogger/SettingsActivity$WheelScroll;-><init>(Landroid/widget/ScrollView;I)V

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    invoke-virtual {v4, v3}, Llocal/gmslogger/SettingsActivity$WheelScroll;->upd(Landroid/widget/ScrollView;)V

    const-string v5, "settings"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v6, "max_mb"

    const/16 v7, 0x400

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    add-int/lit16 v5, v5, 0x200

    div-int/lit16 v5, v5, 0x400

    const/4 v6, 0x1

    if-ge v5, v6, :cond_1

    move v5, v6

    :cond_1
    const/16 v6, 0xa

    if-le v5, v6, :cond_2

    move v5, v6

    :cond_2
    add-int/lit8 v5, v5, -0x1

    mul-int/2addr v5, v1

    new-instance v6, Llocal/gmslogger/SettingsActivity$WheelRun;

    const/4 v7, 0x1

    invoke-direct {v6, v3, v7, v5, v1}, Llocal/gmslogger/SettingsActivity$WheelRun;-><init>(Landroid/widget/ScrollView;III)V

    invoke-virtual {v3, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x4

    invoke-virtual {v0, v8}, Llocal/gmslogger/SettingsActivity;->px(I)I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual {v5, v8, v9, v8, v9}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    new-instance v6, Landroid/view/View;

    invoke-direct {v6, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v8, 0x3333ff33

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v8, 0xc

    invoke-virtual {v0, v8}, Llocal/gmslogger/SettingsActivity;->px(I)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    const/16 v9, 0x10

    invoke-direct {v10, v8, v1, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    mul-int/lit8 v9, v1, 0x5

    invoke-direct {v7, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v5, v6, v10}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Llocal/gmslogger/SettingsActivity;->dialogTheme()I

    move-result v7

    invoke-direct {v6, v0, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const-string v7, "Maksimum log boyutu"

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    new-instance v7, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;

    invoke-direct {v7, v0, v3, v1}, Llocal/gmslogger/SettingsActivity$SaveMaxWheel;-><init>(Llocal/gmslogger/SettingsActivity;Landroid/widget/ScrollView;I)V

    const-string v8, "Kaydet"

    invoke-virtual {v6, v8, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit8 v8, v8, 0x3

    div-int/lit8 v8, v8, 0x4

    const/4 v9, -0x2

    invoke-virtual {v7, v8, v9}, Landroid/view/Window;->setLayout(II)V

    return-void
.end method
