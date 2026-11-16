.class public Llocal/gmslogger/FilterActivity;
.super Landroid/app/Activity;
.source "FilterActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Llocal/gmslogger/FilterActivity$App;
    }
.end annotation


# static fields
.field private static final BG:I = -0x1000000

.field private static final DIM:I = -0xe070e1

.field private static final FG:I = -0xcc00cd

.field private static final PANEL:I = -0xf5f5f6


# instance fields
.field private adapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter<",
            "Llocal/gmslogger/FilterActivity$App;",
            ">;"
        }
    .end annotation
.end field

.field private final apps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Llocal/gmslogger/FilterActivity$App;",
            ">;"
        }
    .end annotation
.end field

.field private errorBox:Landroid/widget/CheckBox;

.field private infoBox:Landroid/widget/CheckBox;

.field private list:Landroid/widget/ListView;

.field private query:Landroid/widget/EditText;

.field private saveBox:Landroid/widget/CheckBox;

.field private final selected:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final shown:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Llocal/gmslogger/FilterActivity$App;",
            ">;"
        }
    .end annotation
.end field

.field private systemBox:Landroid/widget/CheckBox;

.field private warnBox:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Llocal/gmslogger/FilterActivity;->apps:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    return-void
.end method

.method static synthetic access$000(Llocal/gmslogger/FilterActivity;)V
    .locals 0

    invoke-direct {p0}, Llocal/gmslogger/FilterActivity;->save()V

    return-void
.end method

.method static synthetic access$100(Llocal/gmslogger/FilterActivity;)V
    .locals 0

    invoke-direct {p0}, Llocal/gmslogger/FilterActivity;->refresh()V

    return-void
.end method

.method private check(IZ)Landroid/widget/CheckBox;
    .locals 2

    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setText(I)V

    const p1, -0xcc00cd

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setTextColor(I)V

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    return-object v0
.end method

.method private dp(I)I
    .locals 1

    int-to-float p1, p1

    invoke-virtual {p0}, Llocal/gmslogger/FilterActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private field(I)Landroid/widget/EditText;
    .locals 4

    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(I)V

    const p1, -0xd565d6

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHintTextColor(I)V

    const p1, -0xcc00cd

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextColor(I)V

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0xebebec    # -1.9683E38f

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v3

    invoke-virtual {v1, v3, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/16 p1, 0x8

    invoke-direct {p0, p1}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/16 p1, 0xc

    invoke-direct {p0, p1}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v1

    const/16 v2, 0xa

    invoke-direct {p0, v2}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, p1}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result p1

    invoke-direct {p0, v2}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, v3, p1, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    return-object v0
.end method

.method private label(II)Landroid/widget/TextView;
    .locals 2

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/16 p1, 0x10

    const/16 p2, 0x8

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, v1, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method static synthetic lambda$onCreate$4(Llocal/gmslogger/FilterActivity$App;Llocal/gmslogger/FilterActivity$App;)I
    .locals 0

    iget-object p0, p0, Llocal/gmslogger/FilterActivity$App;->label:Ljava/lang/String;

    iget-object p1, p1, Llocal/gmslogger/FilterActivity$App;->label:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private refresh()V
    .locals 8

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->query:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->apps:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llocal/gmslogger/FilterActivity$App;

    iget-object v3, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    iget-object v4, v2, Llocal/gmslogger/FilterActivity$App;->pkg:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->apps:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llocal/gmslogger/FilterActivity$App;

    iget-boolean v4, v2, Llocal/gmslogger/FilterActivity$App;->system:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_4

    iget-object v4, p0, Llocal/gmslogger/FilterActivity;->systemBox:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_2

    :cond_3
    const/4 v4, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v4, 0x1

    :goto_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_5

    iget-object v6, v2, Llocal/gmslogger/FilterActivity$App;->label:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    iget-object v6, v2, Llocal/gmslogger/FilterActivity$App;->pkg:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    :cond_5
    const/4 v3, 0x1

    :cond_6
    iget-object v5, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    iget-object v6, v2, Llocal/gmslogger/FilterActivity$App;->pkg:Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    if-eqz v4, :cond_2

    if-eqz v3, :cond_2

    iget-object v3, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_7
    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    :goto_4
    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_8

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->list:Landroid/widget/ListView;

    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    iget-object v2, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llocal/gmslogger/FilterActivity$App;

    iget-object v2, v2, Llocal/gmslogger/FilterActivity$App;->pkg:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v3, v1}, Landroid/widget/ListView;->setItemChecked(IZ)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_8
    return-void
.end method

.method private save()V
    .locals 4

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->errorBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->warnBox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    or-int/2addr v0, v1

    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->infoBox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v2, 0x4

    :cond_1
    or-int/2addr v0, v2

    invoke-static {p0}, Llocal/gmslogger/LogFilter;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/util/HashSet;

    iget-object v3, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const-string v3, "packages"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "levels"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->systemBox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    const-string v2, "system"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "save"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0$local-gmslogger-FilterActivity(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Llocal/gmslogger/FilterActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$1$local-gmslogger-FilterActivity(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    iget-object p1, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llocal/gmslogger/FilterActivity$App;

    iget-object p2, p0, Llocal/gmslogger/FilterActivity;->list:Landroid/widget/ListView;

    invoke-virtual {p2, p3}, Landroid/widget/ListView;->isItemChecked(I)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    iget-object p1, p1, Llocal/gmslogger/FilterActivity$App;->pkg:Ljava/lang/String;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p2, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    iget-object p1, p1, Llocal/gmslogger/FilterActivity$App;->pkg:Ljava/lang/String;

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_0
    invoke-direct {p0}, Llocal/gmslogger/FilterActivity;->save()V

    return-void
.end method

.method synthetic lambda$onCreate$2$local-gmslogger-FilterActivity(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Llocal/gmslogger/FilterActivity;->save()V

    invoke-direct {p0}, Llocal/gmslogger/FilterActivity;->refresh()V

    return-void
.end method

.method synthetic lambda$onCreate$3$local-gmslogger-FilterActivity()V
    .locals 8

    invoke-virtual {p0}, Llocal/gmslogger/FilterActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ApplicationInfo;

    iget v5, v4, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v5, v5, 0x81

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    goto :goto_1

    :cond_0
    const/4 v5, 0x0

    :goto_1
    new-instance v6, Llocal/gmslogger/FilterActivity$App;

    invoke-virtual {v0, v4}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {v6, v7, v4, v5}, Llocal/gmslogger/FilterActivity$App;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance v0, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v0, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, v1}, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda1;-><init>(Llocal/gmslogger/FilterActivity;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Llocal/gmslogger/FilterActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$onCreate$5$local-gmslogger-FilterActivity(Ljava/util/List;)V
    .locals 1

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->apps:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-direct {p0}, Llocal/gmslogger/FilterActivity;->refresh()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Llocal/gmslogger/LogFilter$Snapshot;

    invoke-direct {p1, p0}, Llocal/gmslogger/LogFilter$Snapshot;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->selected:Ljava/util/Set;

    iget-object v1, p1, Llocal/gmslogger/LogFilter$Snapshot;->packages:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/16 v2, 0x20

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/ImageButton;

    invoke-direct {v2, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    const/high16 v3, 0x7f020000

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v4, 0x8

    invoke-direct {p0, v4}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v4}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v4}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v4}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v4

    invoke-virtual {v2, v5, v6, v7, v4}, Landroid/widget/ImageButton;->setPadding(IIII)V

    new-instance v4, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda2;

    invoke-direct {v4, p0}, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda2;-><init>(Llocal/gmslogger/FilterActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f03001a

    const v5, -0xcc00cd

    invoke-direct {p0, v4, v5}, Llocal/gmslogger/FilterActivity;->label(II)Landroid/widget/TextView;

    move-result-object v4

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    const-string v6, "fonts/PixelOperatorMonoHB8.ttf"

    invoke-static {v5, v6}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x2c

    invoke-direct {p0, v7}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v7}, Llocal/gmslogger/FilterActivity;->dp(I)I

    move-result v7

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget v2, p1, Llocal/gmslogger/LogFilter$Snapshot;->levels:I

    and-int/2addr v2, v1

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const v4, 0x7f03001d

    invoke-direct {p0, v4, v2}, Llocal/gmslogger/FilterActivity;->check(IZ)Landroid/widget/CheckBox;

    move-result-object v2

    iput-object v2, p0, Llocal/gmslogger/FilterActivity;->errorBox:Landroid/widget/CheckBox;

    iget v2, p1, Llocal/gmslogger/LogFilter$Snapshot;->levels:I

    const/4 v4, 0x2

    and-int/2addr v2, v4

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    const v5, 0x7f03001f

    invoke-direct {p0, v5, v2}, Llocal/gmslogger/FilterActivity;->check(IZ)Landroid/widget/CheckBox;

    move-result-object v2

    iput-object v2, p0, Llocal/gmslogger/FilterActivity;->warnBox:Landroid/widget/CheckBox;

    iget v2, p1, Llocal/gmslogger/LogFilter$Snapshot;->levels:I

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    const v2, 0x7f03001e

    invoke-direct {p0, v2, v1}, Llocal/gmslogger/FilterActivity;->check(IZ)Landroid/widget/CheckBox;

    move-result-object v1

    iput-object v1, p0, Llocal/gmslogger/FilterActivity;->infoBox:Landroid/widget/CheckBox;

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Llocal/gmslogger/FilterActivity;->errorBox:Landroid/widget/CheckBox;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v5, v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Llocal/gmslogger/FilterActivity;->warnBox:Landroid/widget/CheckBox;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Llocal/gmslogger/FilterActivity;->infoBox:Landroid/widget/CheckBox;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const v2, 0x7f030015

    const v5, -0xe070e1

    invoke-direct {p0, v2, v5}, Llocal/gmslogger/FilterActivity;->label(II)Landroid/widget/TextView;

    move-result-object v2

    const v2, 0x7f030013

    invoke-direct {p0, v2}, Llocal/gmslogger/FilterActivity;->field(I)Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Llocal/gmslogger/FilterActivity;->query:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Llocal/gmslogger/LogFilter;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v1, "system"

    invoke-interface {p1, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    const v1, 0x7f030018

    invoke-direct {p0, v1, p1}, Llocal/gmslogger/FilterActivity;->check(IZ)Landroid/widget/CheckBox;

    move-result-object p1

    iput-object p1, p0, Llocal/gmslogger/FilterActivity;->systemBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Llocal/gmslogger/FilterActivity$1;

    const v1, 0x1090010

    iget-object v2, p0, Llocal/gmslogger/FilterActivity;->shown:Ljava/util/List;

    invoke-direct {p1, p0, p0, v1, v2}, Llocal/gmslogger/FilterActivity$1;-><init>(Llocal/gmslogger/FilterActivity;Landroid/content/Context;ILjava/util/List;)V

    iput-object p1, p0, Llocal/gmslogger/FilterActivity;->adapter:Landroid/widget/ArrayAdapter;

    new-instance p1, Landroid/widget/ListView;

    invoke-direct {p1, p0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Llocal/gmslogger/FilterActivity;->list:Landroid/widget/ListView;

    invoke-virtual {p1, v4}, Landroid/widget/ListView;->setChoiceMode(I)V

    iget-object p1, p0, Llocal/gmslogger/FilterActivity;->list:Landroid/widget/ListView;

    iget-object v1, p0, Llocal/gmslogger/FilterActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Llocal/gmslogger/FilterActivity;->list:Landroid/widget/ListView;

    new-instance v1, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda3;-><init>(Llocal/gmslogger/FilterActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Llocal/gmslogger/FilterActivity;->list:Landroid/widget/ListView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0}, Llocal/gmslogger/FilterActivity;->setContentView(Landroid/view/View;)V

    new-instance p1, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0}, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda4;-><init>(Llocal/gmslogger/FilterActivity;)V

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->errorBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->warnBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->infoBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->systemBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Llocal/gmslogger/FilterActivity$2;

    invoke-direct {p1, p0}, Llocal/gmslogger/FilterActivity$2;-><init>(Llocal/gmslogger/FilterActivity;)V

    iget-object v0, p0, Llocal/gmslogger/FilterActivity;->query:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Llocal/gmslogger/FilterActivity$$ExternalSyntheticLambda5;-><init>(Llocal/gmslogger/FilterActivity;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method
