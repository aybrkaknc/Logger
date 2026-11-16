.class public Llocal/gmslogger/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static final BG:I = -0x1000000

.field private static final DIM:I = -0xe070e1

.field private static final EXPLAIN:[I

.field private static final EXPORT_DIR:Ljava/lang/String; = "Documents/Logs"

.field private static final FADE_MS:I = 0xdc

.field private static final FG:I = -0xcc00cd

.field private static final PANEL:I = -0xf5f5f6

.field private static final PATTERNS:[Ljava/lang/String;

.field private static final QUICK_MS:I = 0x96

.field private static final RED:I = -0xbbbc

.field private static final SELECTED:I = -0xe5a3e6

.field private static final WHITE:I = -0x1

.field private static final YELLOW:I = -0x2900


# instance fields
.field private allFile:Ljava/io/File;

.field private final animators:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/TextView;",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private appliedFont:I

.field private final argb:Landroid/animation/ArgbEvaluator;

.field private catIcon:Landroid/widget/ImageView;

.field private file:Ljava/io/File;

.field private filterBarView:Landroid/widget/LinearLayout;

.field private filterSummary:Landroid/widget/TextView;

.field private final handler:Landroid/os/Handler;

.field private final io:Ljava/util/concurrent/ExecutorService;

.field private final labels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private lastKey:Ljava/lang/String;

.field private lastLength:J

.field private loading:Z

.field private logBox:Landroid/widget/LinearLayout;

.field private menuShown:Z

.field private final refresh:Ljava/lang/Runnable;

.field private renderedLine:Ljava/lang/String;

.field private searchBar:Landroid/widget/LinearLayout;

.field private searchInput:Landroid/widget/EditText;

.field private searchOpen:Z

.field private selectedLine:Ljava/lang/String;

.field private snapshot:Llocal/gmslogger/LogFilter$Snapshot;

.field private state:Landroid/widget/TextView;

.field private toggle:Landroid/widget/ImageButton;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x4

    .line 78
    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "FATAL EXCEPTION"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "ANR in"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "SQLITE_READONLY_DBMOVED"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "has died"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sput-object v0, Llocal/gmslogger/MainActivity;->PATTERNS:[Ljava/lang/String;

    const v0, 0x7f030008

    const v1, 0x7f030009

    const v2, 0x7f030007

    const v3, 0x7f030006

    .line 79
    filled-new-array {v2, v3, v0, v1}, [I

    move-result-object v0

    sput-object v0, Llocal/gmslogger/MainActivity;->EXPLAIN:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 66
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 80
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    .line 81
    new-instance v0, Llocal/gmslogger/MainActivity$1;

    invoke-direct {v0, p0}, Llocal/gmslogger/MainActivity$1;-><init>(Llocal/gmslogger/MainActivity;)V

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->refresh:Ljava/lang/Runnable;

    .line 101
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->io:Ljava/util/concurrent/ExecutorService;

    const-wide/16 v0, -0x1

    .line 103
    iput-wide v0, p0, Llocal/gmslogger/MainActivity;->lastLength:J

    .line 105
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->animators:Ljava/util/Map;

    .line 106
    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->argb:Landroid/animation/ArgbEvaluator;

    .line 107
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->labels:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Llocal/gmslogger/MainActivity;)V
    .locals 0

    .line 66
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->updateView()V

    return-void
.end method

.method static synthetic access$100(Llocal/gmslogger/MainActivity;)Landroid/os/Handler;
    .locals 0

    .line 66
    iget-object p0, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$200(Llocal/gmslogger/MainActivity;)Ljava/util/Map;
    .locals 0

    .line 66
    iget-object p0, p0, Llocal/gmslogger/MainActivity;->animators:Ljava/util/Map;

    return-object p0
.end method

.method private actionParams(II)Landroid/widget/LinearLayout$LayoutParams;
    .locals 2

    .line 289
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result p1

    invoke-direct {v0, v1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 p1, 0x50

    .line 290
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 291
    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    return-object v0
.end method

.method private addBarIcon(Landroid/view/View$OnClickListener;)V
    .locals 6
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    new-instance v0, Landroid/widget/ImageButton;

    invoke-direct {v0, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "ic_save_bar"

    const-string v3, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v1, 0x8

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/ImageButton;->setPadding(IIII)V

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/16 v2, 0x2c

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v4, p0, Llocal/gmslogger/MainActivity;->filterBarView:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->normalizeBar()V

    return-void
.end method

.method private addZoom(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .locals 4
    .param p1, "bar"    # Landroid/widget/LinearLayout;
    .param p2, "btn"    # Landroid/view/View;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x2c

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x6

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private adjustFont(I)V
    .locals 2

    .line 349
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->fontSize()I

    move-result v0

    add-int/2addr v0, p1

    const/16 p1, 0x14

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/16 v0, 0x8

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 350
    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Llocal/gmslogger/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "font_sp"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private animate(Landroid/widget/TextView;F)V
    .locals 3

    .line 577
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->animators:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 578
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_0

    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p2

    :goto_0
    if-eqz v0, :cond_1

    .line 580
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1
    const/4 v0, 0x2

    .line 582
    new-array v0, v0, [F

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v1, 0x1

    aput p2, v0, v1

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    const-wide/16 v0, 0xdc

    .line 583
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 584
    new-instance v0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p1}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda3;-><init>(Llocal/gmslogger/MainActivity;Landroid/widget/TextView;)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 585
    new-instance v0, Llocal/gmslogger/MainActivity$3;

    invoke-direct {v0, p0, p1}, Llocal/gmslogger/MainActivity$3;-><init>(Llocal/gmslogger/MainActivity;Landroid/widget/TextView;)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 591
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->animators:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method private appName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 499
    invoke-static {p1}, Llocal/gmslogger/LogFilter;->uid(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 500
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->labels:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 501
    iget-object p1, p0, Llocal/gmslogger/MainActivity;->labels:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 503
    :cond_0
    invoke-direct {p0, p1, v0}, Llocal/gmslogger/MainActivity;->resolveAppName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    if-ltz v0, :cond_1

    .line 505
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->labels:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object p1
.end method

.method private applySelection()V
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 564
    :goto_0
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 565
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 566
    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    .line 567
    iget-object v5, p0, Llocal/gmslogger/MainActivity;->renderedLine:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    goto :goto_1

    :cond_0
    const/4 v5, 0x0

    :goto_1
    if-eqz v3, :cond_1

    .line 568
    iget-object v6, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_2

    :cond_1
    const/4 v4, 0x0

    :goto_2
    if-eq v5, v4, :cond_3

    if-eqz v4, :cond_2

    const/high16 v3, 0x3f800000    # 1.0f

    goto :goto_3

    :cond_2
    const/4 v3, 0x0

    .line 570
    :goto_3
    invoke-direct {p0, v2, v3}, Llocal/gmslogger/MainActivity;->animate(Landroid/widget/TextView;F)V

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 573
    :cond_4
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->renderedLine:Ljava/lang/String;

    return-void
.end method

.method private catView(Landroid/widget/LinearLayout;)V
    .locals 6
    .param p1, "row"    # Landroid/widget/LinearLayout;

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "cat_run"

    const-string v3, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    check-cast v2, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    iput-object v0, p0, Llocal/gmslogger/MainActivity;->catIcon:Landroid/widget/ImageView;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v1, 0x24

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    const/16 v2, 0x18

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {v5, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v3, 0x0

    iput v3, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {p1, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private chooseExport()V
    .locals 4

    .line 674
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f03000e

    .line 675
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/CharSequence;

    const v2, 0x7f03000b

    .line 676
    invoke-virtual {p0, v2}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, 0x7f03000d

    invoke-virtual {p0, v2}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda17;

    invoke-direct {v2, p0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda17;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 678
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private createTarget(Ljava/lang/String;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "settings"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "export_tree"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string v4, "text/plain"

    invoke-static {v0, v3, v4, p1}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v2, "external"

    invoke-static {v2}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private describe(Ljava/lang/String;F)Ljava/lang/CharSequence;
    .locals 8

    .line 530
    invoke-static {p1}, Llocal/gmslogger/LogFilter;->level(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f03001e

    .line 532
    invoke-virtual {p0, v1}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 533
    const-string v2, "E"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "F"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 536
    :cond_0
    const-string v2, "W"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "died"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const v0, -0xcc00cd

    goto :goto_2

    :cond_2
    :goto_0
    const v0, 0x7f03001f

    .line 538
    invoke-virtual {p0, v0}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v0, -0x2900

    goto :goto_2

    :cond_3
    :goto_1
    const v0, 0x7f03001d

    .line 535
    invoke-virtual {p0, v0}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v0, -0xbbbc

    .line 540
    :goto_2
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->argb:Landroid/animation/ArgbEvaluator;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, p2, v0, v4}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 541
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->argb:Landroid/animation/ArgbEvaluator;

    const v4, -0xe070e1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, p2, v4, v3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 542
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xe

    if-lt v2, v3, :cond_4

    const/4 v2, 0x6

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    :cond_4
    const-string v2, ""

    .line 543
    :goto_3
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 544
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    .line 545
    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    const-string v5, " - "

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->appName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    .line 546
    :cond_5
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    const/16 v5, 0x21

    invoke-virtual {v3, v1, v4, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 547
    new-instance v1, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    invoke-virtual {v3, v1, v4, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    const/4 v1, 0x0

    .line 548
    :goto_4
    sget-object v2, Llocal/gmslogger/MainActivity;->PATTERNS:[Ljava/lang/String;

    array-length v4, v2

    const-string v6, "\n"

    if-ge v1, v4, :cond_7

    .line 549
    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 550
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    .line 551
    invoke-virtual {v3, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    sget-object v7, Llocal/gmslogger/MainActivity;->EXPLAIN:[I

    aget v1, v7, v1

    invoke-virtual {p0, v1}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 552
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    invoke-virtual {v3, v1, v2, v0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_5

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 556
    :cond_7
    :goto_5
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 557
    invoke-virtual {v3, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 558
    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {p1, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    invoke-virtual {v3, p1, v0, p2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 559
    new-instance p1, Landroid/text/style/RelativeSizeSpan;

    const p2, 0x3f4ccccd    # 0.8f

    invoke-direct {p1, p2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    invoke-virtual {v3, p1, v0, p2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object v3
.end method

.method private dp(I)I
    .locals 1

    int-to-float p1, p1

    .line 322
    invoke-virtual {p0}, Llocal/gmslogger/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private entry(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 5

    .line 460
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 461
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 462
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 463
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->fontSize()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0xcc00cd

    .line 464
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v1, 0xc

    .line 465
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v4, -0x2

    iput v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 466
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 467
    :goto_0
    invoke-direct {p0, p1, v1}, Llocal/gmslogger/MainActivity;->describe(Ljava/lang/String;F)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 468
    iget-object v3, p0, Llocal/gmslogger/MainActivity;->argb:Landroid/animation/ArgbEvaluator;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const v4, -0xe5a3e6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v1, v2, v4}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 469
    new-instance v1, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0, p1}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda14;-><init>(Llocal/gmslogger/MainActivity;Ljava/lang/String;)V

    .line 475
    new-instance v2, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;

    invoke-direct {v2, p0, v1, p1}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda15;-><init>(Llocal/gmslogger/MainActivity;Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 490
    new-instance v2, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda16;

    invoke-direct {v2, p0, v1, p1}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda16;-><init>(Llocal/gmslogger/MainActivity;Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-object v0
.end method

.method private exportDir()Ljava/lang/String;
    .locals 3

    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "export_dir"

    const-string v2, "Documents/Logs"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private filterBar()Landroid/widget/LinearLayout;
    .locals 6

    .line 198
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const v1, 0x7f020002

    .line 199
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 200
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    .line 201
    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 202
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    const v2, -0xcc00cd

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 204
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 205
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    const/16 v2, 0xc

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 206
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    .line 207
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const v3, -0xf5f5f6

    .line 208
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 209
    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    const/16 v5, 0x20

    invoke-virtual {v1, v5, v3, v5, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 210
    new-instance v2, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda1;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x18

    invoke-direct {p0, v3}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v3}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {v2, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v4, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    new-instance v0, Landroid/widget/ImageButton;

    invoke-direct {v0, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    const v2, 0x7f020004

    .line 214
    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 215
    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 216
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/4 v2, 0x6

    .line 217
    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 218
    new-instance v2, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda2;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x24

    invoke-direct {p0, v3}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v3}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v1
.end method

.method private fontAsset(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->pulseCat()V

    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->pulseCat()V

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method private fontSize()I
    .locals 3

    .line 345
    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Llocal/gmslogger/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "font_sp"

    const/16 v2, 0xb

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method static synthetic lambda$pressEffect$0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 312
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 313
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const p1, 0x3f666666    # 0.9f

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x50

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 314
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 315
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x78

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_2
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private normalizeBar()V
    .locals 8

    iget-object v0, p0, Llocal/gmslogger/MainActivity;->filterBarView:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    const/16 v1, 0x6

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    const/16 v2, 0x20

    invoke-virtual {v0, v2, v1, v2, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/16 v1, 0x2c

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    const/16 v2, 0xa

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    :goto_0
    if-ge v3, v4, :cond_0

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v5, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    const/16 v6, 0x10

    invoke-direct {p0, v6}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v7, v7}, Landroid/view/View;->setPadding(IIII)V

    :cond_1
    return-void
.end method

.method private paint(Landroid/widget/TextView;Ljava/lang/String;F)V
    .locals 3

    .line 596
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->argb:Landroid/animation/ArgbEvaluator;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, -0xe5a3e6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, p3, v1, v2}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 597
    invoke-direct {p0, p2, p3}, Llocal/gmslogger/MainActivity;->describe(Ljava/lang/String;F)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private pickEntryAction(ILjava/lang/String;)V
    .locals 1

    if-nez p1, :cond_0

    .line 639
    const-string p1, "clipboard"

    invoke-virtual {p0, p1}, Llocal/gmslogger/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/ClipboardManager;

    .line 640
    const-string v0, "log"

    invoke-static {v0, p2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    const p1, 0x7f030004

    const/4 p2, 0x0

    .line 641
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 643
    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->showSelectable(Ljava/lang/String;)V

    return-void

    .line 645
    :cond_1
    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->shareEntry(Ljava/lang/String;)V

    return-void
.end method

.method private pressEffect(Landroid/view/View;)V
    .locals 1

    .line 311
    new-instance v0, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda10;

    invoke-direct {v0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda10;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private pulseCat()V
    .locals 1

    iget-object v0, p0, Llocal/gmslogger/MainActivity;->catIcon:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_0
    return-void
.end method

.method private recentLines(Ljava/io/File;Llocal/gmslogger/LogFilter$Snapshot;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Llocal/gmslogger/LogFilter$Snapshot;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 415
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 416
    :try_start_0
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    :try_start_1
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    const-wide/32 v4, 0x493e0

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 418
    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 419
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v6

    sub-long/2addr v6, v2

    long-to-int p1, v6

    new-array p1, p1, [B

    .line 420
    invoke-virtual {v1, p1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 421
    new-instance v6, Ljava/lang/String;

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, p1, v7}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const-string p1, "\n"

    invoke-virtual {v6, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 422
    array-length v6, p1

    const/4 v7, 0x1

    sub-int/2addr v6, v7

    :goto_0
    cmp-long v8, v2, v4

    if-lez v8, :cond_0

    const/4 v8, 0x1

    goto :goto_1

    :cond_0
    const/4 v8, 0x0

    :goto_1
    if-lt v6, v8, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    const/16 v9, 0xc8

    if-ge v8, v9, :cond_2

    .line 423
    aget-object v8, p1, v6

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1

    aget-object v8, p1, v6

    invoke-static {v8}, Llocal/gmslogger/LogFilter;->hidden(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    aget-object v8, p1, v6

    invoke-virtual {p2, v8}, Llocal/gmslogger/LogFilter$Snapshot;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 424
    aget-object v8, p1, v6

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 427
    :cond_2
    :try_start_2
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v0

    :catchall_0
    move-exception p1

    .line 416
    :try_start_3
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p2

    :try_start_4
    invoke-static {p1, p2}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_2
    throw p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    return-object v0
.end method

.method private resolveAppName(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 511
    invoke-virtual {p0}, Llocal/gmslogger/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    if-ltz p2, :cond_0

    .line 512
    invoke-virtual {v0, p2}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_1

    .line 513
    array-length v1, p2

    if-lez v1, :cond_1

    const/4 p1, 0x0

    .line 515
    :try_start_0
    aget-object v1, p2, p1

    invoke-virtual {v0, v1, p1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 517
    :catch_0
    aget-object p1, p2, p1

    return-object p1

    .line 520
    :cond_1
    const-string p2, "com.google.android.gms"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_2

    const/high16 p1, 0x7f030000

    .line 521
    invoke-virtual {p0, p1}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 523
    :cond_2
    const-string p2, "com.android.vending"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    const p1, 0x7f030002

    .line 524
    invoke-virtual {p0, p1}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 526
    :cond_3
    const-string p1, ""

    return-object p1
.end method

.method private restyle(Landroid/view/View;III)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "fill"    # I
    .param p3, "stroke"    # I
    .param p4, "sizeDp"    # I

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    if-eqz p3, :cond_0

    const/4 v1, 0x2

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1, p3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    :cond_0
    div-int/lit8 v1, p4, 0x4

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private searchBar()Landroid/widget/LinearLayout;
    .locals 9

    .line 224
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/high16 v1, -0x1000000

    .line 225
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/16 v1, 0x8

    .line 226
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x20

    invoke-virtual {v0, v4, v2, v4, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 227
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    const v3, 0x7f030019

    .line 228
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(I)V

    .line 229
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    const v3, -0xd565d6

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 230
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    const v3, -0xcc00cd

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setTextColor(I)V

    .line 231
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 232
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 233
    iget-object v2, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    const/16 v5, 0xc

    invoke-direct {p0, v5}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v6

    const/16 v7, 0xa

    invoke-direct {p0, v7}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v5}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v7}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v7

    invoke-virtual {v2, v6, v8, v5, v7}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 234
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v5, -0xebebec    # -1.9683E38f

    .line 235
    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 236
    invoke-direct {p0, v4}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v5

    invoke-virtual {v2, v5, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 237
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 238
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 239
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    invoke-static {p0}, Llocal/gmslogger/LogFilter;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "text"

    const-string v5, ""

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 240
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    new-instance v2, Llocal/gmslogger/MainActivity$2;

    invoke-direct {v2, p0}, Llocal/gmslogger/MainActivity$2;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 255
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 256
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    iput-boolean v4, p0, Llocal/gmslogger/MainActivity;->searchOpen:Z

    return-object v0
.end method

.method private shareEntry(Ljava/lang/String;)V
    .locals 3

    .line 667
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 668
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x1

    .line 669
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const p1, 0x7f030024

    invoke-virtual {p0, p1, v1}, Llocal/gmslogger/MainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const p1, 0x7f030029

    .line 670
    invoke-virtual {p0, p1}, Llocal/gmslogger/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Llocal/gmslogger/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private showEntryMenu(Ljava/lang/String;Landroid/view/View;)V
    .locals 11

    const/4 v0, 0x1

    .line 601
    iput-boolean v0, p0, Llocal/gmslogger/MainActivity;->menuShown:Z

    .line 602
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 603
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 604
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v3, -0xf5f5f6

    .line 605
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 606
    invoke-direct {p0, v0}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    const v4, -0xcc00cd

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/16 v3, 0x8

    .line 607
    invoke-direct {p0, v3}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 608
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 609
    new-instance v2, Landroid/widget/PopupWindow;

    const/4 v5, -0x2

    invoke-direct {v2, v1, v5, v5, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 610
    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 611
    invoke-virtual {v2, v0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 612
    invoke-direct {p0, v3}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v2, v0}, Landroid/widget/PopupWindow;->setElevation(F)V

    const v0, 0x7f030027

    const v3, 0x7f030029

    const v5, 0x7f030005

    .line 613
    filled-new-array {v5, v0, v3}, [I

    move-result-object v0

    const/4 v3, 0x0

    :goto_0
    const/16 v5, 0x10

    const/4 v7, 0x3

    if-ge v3, v7, :cond_0

    .line 616
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 617
    aget v8, v0, v3

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(I)V

    .line 618
    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 619
    sget-object v8, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/high16 v8, 0x41500000    # 13.0f

    .line 620
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 621
    invoke-direct {p0, v5}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v8

    const/16 v9, 0xc

    invoke-direct {p0, v9}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v10

    invoke-direct {p0, v5}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v9}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v9

    invoke-virtual {v7, v8, v10, v5, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 622
    new-instance v5, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda11;

    invoke-direct {v5, p0, v2, v3, p1}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda11;-><init>(Llocal/gmslogger/MainActivity;Landroid/widget/PopupWindow;ILjava/lang/String;)V

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 626
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 628
    :cond_0
    new-instance p1, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda12;

    invoke-direct {p1, p0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda12;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v2, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    const/high16 p1, 0x7f040000

    .line 633
    invoke-virtual {v2, p1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 634
    invoke-direct {p0, v5}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result p1

    invoke-virtual {v2, p2, p1, v6}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    return-void
.end method

.method private showFilterState()V
    .locals 3

    .line 281
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->snapshot:Llocal/gmslogger/LogFilter$Snapshot;

    iget-object v0, v0, Llocal/gmslogger/LogFilter$Snapshot;->packages:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Llocal/gmslogger/MainActivity;->snapshot:Llocal/gmslogger/LogFilter$Snapshot;

    iget v0, v0, Llocal/gmslogger/LogFilter$Snapshot;->levels:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Llocal/gmslogger/MainActivity;->snapshot:Llocal/gmslogger/LogFilter$Snapshot;

    iget-object v0, v0, Llocal/gmslogger/LogFilter$Snapshot;->text:Ljava/lang/String;

    .line 283
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 284
    :goto_1
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    const v2, 0x7f030011

    goto :goto_2

    :cond_2
    const v2, 0x7f030016

    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 285
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->filterSummary:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    const v0, -0xcc00cd

    goto :goto_3

    :cond_3
    const v0, -0xe070e1

    :goto_3
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method private showSelectable(Ljava/lang/String;)V
    .locals 4

    .line 650
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 651
    invoke-direct {p0, p1, v1}, Llocal/gmslogger/MainActivity;->describe(Ljava/lang/String;F)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    .line 652
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 653
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const p1, -0xcc00cd

    .line 654
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 655
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->fontSize()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 p1, 0x10

    .line 656
    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result p1

    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 657
    new-instance p1, Landroid/widget/ScrollView;

    invoke-direct {p1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, -0x1000000

    .line 658
    invoke-virtual {p1, v1}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 659
    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 660
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 661
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x7f030003

    const/4 v1, 0x0

    .line 662
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 663
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private slideIn(Landroid/widget/TextView;I)V
    .locals 2

    const/4 v0, 0x0

    .line 453
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    const/16 v1, 0x28

    .line 454
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 455
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 456
    invoke-virtual {p1}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0xdc

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method private square(IILandroid/view/View$OnClickListener;)Landroid/widget/ImageButton;
    .locals 3

    .line 296
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0xf5f5f6

    .line 297
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v1, 0x1

    .line 298
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    const v2, -0xcc00cd

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    mul-int/lit8 v1, p2, 0x3

    .line 299
    div-int/lit8 v1, v1, 0xa

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 300
    new-instance v1, Landroid/widget/ImageButton;

    invoke-direct {v1, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 301
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 302
    invoke-virtual {v1, p1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 303
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, p1}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 304
    div-int/lit8 p2, p2, 0x4

    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result p1

    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v0

    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result p2

    invoke-virtual {v1, p1, v0, v2, p2}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 305
    invoke-virtual {v1, p3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 306
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->pressEffect(Landroid/view/View;)V

    return-object v1
.end method

.method private startLogging()V
    .locals 2

    .line 334
    invoke-static {}, Lrikka/shizuku/Shizuku;->pingBinder()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lrikka/shizuku/Shizuku;->checkSelfPermission()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 335
    invoke-static {v0}, Lrikka/shizuku/Shizuku;->requestPermission(I)V

    .line 337
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Llocal/gmslogger/LogService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "local.gmslogger.START"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Llocal/gmslogger/MainActivity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method private stopLogging()V
    .locals 2

    .line 341
    new-instance v0, Landroid/content/Intent;

    const-class v1, Llocal/gmslogger/LogService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "local.gmslogger.STOP"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Llocal/gmslogger/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method private sync(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 434
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 435
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    .line 437
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    goto :goto_1

    :cond_0
    :goto_0
    if-ge v1, v0, :cond_1

    .line 440
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Llocal/gmslogger/MainActivity;->entry(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    invoke-direct {p0, v2, v1}, Llocal/gmslogger/MainActivity;->slideIn(Landroid/widget/TextView;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 444
    :cond_1
    :goto_1
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-le v0, v1, :cond_2

    .line 445
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    goto :goto_1

    .line 447
    :cond_2
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 448
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->entry(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    invoke-direct {p0, v1, v2}, Llocal/gmslogger/MainActivity;->slideIn(Landroid/widget/TextView;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method private toggleLogging()V
    .locals 1

    .line 326
    sget-boolean v0, Llocal/gmslogger/LogService;->running:Z

    if-eqz v0, :cond_0

    .line 327
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->stopLogging()V

    return-void

    .line 329
    :cond_0
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->startLogging()V

    return-void
.end method

.method private toggleSearch()V
    .locals 3

    .line 261
    iget-boolean v0, p0, Llocal/gmslogger/MainActivity;->searchOpen:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Llocal/gmslogger/MainActivity;->searchOpen:Z

    .line 262
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->searchBar:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Llocal/gmslogger/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->measure(II)V

    .line 264
    iget-boolean v0, p0, Llocal/gmslogger/MainActivity;->searchOpen:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Llocal/gmslogger/MainActivity;->searchBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v2

    .line 265
    :cond_0
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->searchBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    filled-new-array {v0, v2}, [I

    move-result-object v0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    const-wide/16 v1, 0xdc

    .line 266
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 267
    new-instance v1, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda4;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 272
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 273
    iget-boolean v0, p0, Llocal/gmslogger/MainActivity;->searchOpen:Z

    if-eqz v0, :cond_1

    .line 274
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    return-void

    .line 276
    :cond_1
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->searchInput:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private updateView()V
    .locals 3

    .line 375
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->fontSize()I

    move-result v0

    .line 376
    iget v1, p0, Llocal/gmslogger/MainActivity;->appliedFont:I

    if-eq v0, v1, :cond_0

    .line 377
    iput v0, p0, Llocal/gmslogger/MainActivity;->appliedFont:I

    const-wide/16 v0, -0x1

    .line 378
    iput-wide v0, p0, Llocal/gmslogger/MainActivity;->lastLength:J

    .line 379
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x6e

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda5;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 382
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 384
    :cond_0
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->state:Landroid/widget/TextView;

    sget-boolean v1, Llocal/gmslogger/LogService;->running:Z

    if-eqz v1, :cond_1

    const v1, 0x7f03002c

    goto :goto_0

    :cond_1
    const v1, 0x7f03002b

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 385
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->state:Landroid/widget/TextView;

    sget-boolean v1, Llocal/gmslogger/LogService;->running:Z

    if-eqz v1, :cond_2

    const v1, -0xcc00cd

    goto :goto_1

    :cond_2
    const v1, -0xcc00cd

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 386
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->toggle:Landroid/widget/ImageButton;

    sget-boolean v1, Llocal/gmslogger/LogService;->running:Z

    if-eqz v1, :cond_3

    const v1, 0x7f020006

    goto :goto_2

    :cond_3
    const v1, 0x7f020003

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 387
    iget-boolean v0, p0, Llocal/gmslogger/MainActivity;->loading:Z

    if-eqz v0, :cond_4

    return-void

    :cond_4
    const/4 v0, 0x1

    .line 390
    iput-boolean v0, p0, Llocal/gmslogger/MainActivity;->loading:Z

    .line 391
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->io:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda6;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private writeExport(Z)V
    .locals 8

    if-eqz p1, :cond_0

    .line 682
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->allFile:Ljava/io/File;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->file:Ljava/io/File;

    :goto_0
    if-eqz p1, :cond_1

    .line 683
    const-string p1, "logcat-all-"

    goto :goto_1

    :cond_1
    const-string p1, "filtered-log-"

    .line 684
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyyMMdd-HHmmss"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {p1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {p1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".txt"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 685
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 686
    const-string v2, "_display_name"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 687
    const-string v2, "mime_type"

    const-string v3, "text/plain"

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    const-string v2, "relative_path"

    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->exportDir()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 689
    invoke-virtual {p0}, Llocal/gmslogger/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "external"

    invoke-static {v3}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {p0, p1, v1}, Llocal/gmslogger/MainActivity;->createTarget(Ljava/lang/String;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    const v2, 0x7f03000c

    const/4 v3, 0x1

    if-nez v1, :cond_2

    .line 691
    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 694
    :cond_2
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {p0}, Llocal/gmslogger/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/16 v1, 0x2000

    .line 695
    :try_start_2
    new-array v1, v1, [B

    .line 697
    :goto_2
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    const/4 v7, 0x0

    if-eq v5, v6, :cond_3

    .line 698
    invoke-virtual {v0, v1, v7, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2

    .line 700
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->exportDir()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v3, [Ljava/lang/Object;

    aput-object p1, v1, v7

    const p1, 0x7f03000f

    invoke-virtual {p0, p1, v1}, Llocal/gmslogger/MainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_4

    .line 701
    :try_start_3
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_4
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    return-void

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_5

    .line 694
    :try_start_5
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    :try_start_6
    invoke-static {p1, v0}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_5
    :goto_3
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception p1

    :try_start_7
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_4

    :catchall_3
    move-exception v0

    :try_start_8
    invoke-static {p1, v0}, Llocal/gmslogger/LogService$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_4
    throw p1
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 702
    :catch_0
    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private zoom(Ljava/lang/String;I)Landroid/widget/Button;
    .locals 3

    .line 354
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0xcc00cd

    .line 355
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v1, 0x2

    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/4 v1, 0x1

    .line 356
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    const v2, -0xcc00cd

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/16 v1, 0xa

    .line 357
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 358
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 359
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 360
    const v2, -0xf5f5f6

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 361
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    const/4 v2, 0x1

    invoke-static {p1, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    const/high16 p1, 0x41400000    # 12.0f

    .line 362
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setTextSize(F)V

    .line 363
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    .line 364
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 365
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 366
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 367
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 368
    invoke-virtual {v1, p1, p1, p1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 369
    new-instance p1, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda13;

    invoke-direct {p1, p0, p2}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda13;-><init>(Llocal/gmslogger/MainActivity;I)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    invoke-direct {p0, v1}, Llocal/gmslogger/MainActivity;->pressEffect(Landroid/view/View;)V

    return-object v1
.end method


# virtual methods
.method synthetic lambda$animate$0$local-gmslogger-MainActivity(Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 584
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-direct {p0, p1, v0, p2}, Llocal/gmslogger/MainActivity;->paint(Landroid/widget/TextView;Ljava/lang/String;F)V

    return-void
.end method

.method synthetic lambda$chooseExport$0$local-gmslogger-MainActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 0
    if-nez p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 677
    :goto_0
    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->writeExport(Z)V

    return-void
.end method

.method synthetic lambda$entry$0$local-gmslogger-MainActivity(Ljava/lang/String;)V
    .locals 1

    .line 470
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Llocal/gmslogger/MainActivity;->menuShown:Z

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 471
    iput-object p1, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    .line 472
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->applySelection()V

    :cond_0
    return-void
.end method

.method synthetic lambda$entry$1$local-gmslogger-MainActivity(Ljava/lang/Runnable;Ljava/lang/String;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 476
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getAction()I

    move-result p3

    if-nez p3, :cond_0

    .line 478
    iget-object p3, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    invoke-virtual {p3, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 479
    iput-object p2, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    .line 480
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->applySelection()V

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    if-ne p3, p2, :cond_1

    .line 482
    iget-object p2, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    const-wide/16 p3, 0x96

    invoke-virtual {p2, p1, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    const/4 p2, 0x3

    if-ne p3, p2, :cond_2

    .line 483
    iget-boolean p2, p0, Llocal/gmslogger/MainActivity;->menuShown:Z

    if-nez p2, :cond_2

    .line 484
    iget-object p2, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    .line 485
    iput-object p1, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    .line 486
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->applySelection()V

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method synthetic lambda$entry$2$local-gmslogger-MainActivity(Ljava/lang/Runnable;Ljava/lang/String;Landroid/view/View;)Z
    .locals 1

    .line 491
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 492
    invoke-direct {p0, p2, p3}, Llocal/gmslogger/MainActivity;->showEntryMenu(Ljava/lang/String;Landroid/view/View;)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$filterBar$0$local-gmslogger-MainActivity(Landroid/view/View;)V
    .locals 1

    .line 210
    new-instance p1, Landroid/content/Intent;

    const-class v0, Llocal/gmslogger/FilterActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Llocal/gmslogger/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$filterBar$1$local-gmslogger-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 218
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->toggleSearch()V

    return-void
.end method

.method synthetic lambda$onCreate$0$local-gmslogger-MainActivity(Landroid/view/View;)V
    .locals 1

    .line 152
    new-instance p1, Landroid/content/Intent;

    const-class v0, Llocal/gmslogger/SettingsActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Llocal/gmslogger/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$local-gmslogger-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 168
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->chooseExport()V

    return-void
.end method

.method synthetic lambda$onCreate$2$local-gmslogger-MainActivity(Landroid/view/View;)V
    .locals 0

    .line 169
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->toggleLogging()V

    return-void
.end method

.method synthetic lambda$showEntryMenu$0$local-gmslogger-MainActivity(Landroid/widget/PopupWindow;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 623
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 624
    invoke-direct {p0, p2, p3}, Llocal/gmslogger/MainActivity;->pickEntryAction(ILjava/lang/String;)V

    return-void
.end method

.method synthetic lambda$showEntryMenu$1$local-gmslogger-MainActivity()V
    .locals 1

    .line 0
    const/4 v0, 0x0

    .line 629
    iput-boolean v0, p0, Llocal/gmslogger/MainActivity;->menuShown:Z

    const/4 v0, 0x0

    .line 630
    iput-object v0, p0, Llocal/gmslogger/MainActivity;->selectedLine:Ljava/lang/String;

    .line 631
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->applySelection()V

    return-void
.end method

.method synthetic lambda$toggleSearch$0$local-gmslogger-MainActivity(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 268
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->searchBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 269
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 270
    iget-object p1, p0, Llocal/gmslogger/MainActivity;->searchBar:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method synthetic lambda$updateView$0$local-gmslogger-MainActivity()V
    .locals 3

    .line 380
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 381
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x6e

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method synthetic lambda$updateView$1$local-gmslogger-MainActivity()V
    .locals 8

    .line 392
    new-instance v0, Llocal/gmslogger/LogFilter$Snapshot;

    invoke-direct {v0, p0}, Llocal/gmslogger/LogFilter$Snapshot;-><init>(Landroid/content/Context;)V

    .line 393
    iget-boolean v1, v0, Llocal/gmslogger/LogFilter$Snapshot;->save:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Llocal/gmslogger/MainActivity;->file:Ljava/io/File;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Llocal/gmslogger/MainActivity;->allFile:Ljava/io/File;

    .line 394
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v3, v0, Llocal/gmslogger/LogFilter$Snapshot;->save:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Llocal/gmslogger/LogFilter$Snapshot;->packages:Ljava/util/Set;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Llocal/gmslogger/LogFilter$Snapshot;->levels:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Llocal/gmslogger/LogFilter$Snapshot;->text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 395
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v3

    .line 397
    iget-wide v5, p0, Llocal/gmslogger/MainActivity;->lastLength:J

    cmp-long v7, v3, v5

    if-nez v7, :cond_2

    iget-object v5, p0, Llocal/gmslogger/MainActivity;->lastKey:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    .line 398
    :cond_2
    :goto_1
    invoke-direct {p0, v1, v0}, Llocal/gmslogger/MainActivity;->recentLines(Ljava/io/File;Llocal/gmslogger/LogFilter$Snapshot;)Ljava/util/List;

    move-result-object v1

    .line 399
    iput-wide v3, p0, Llocal/gmslogger/MainActivity;->lastLength:J

    .line 400
    iput-object v2, p0, Llocal/gmslogger/MainActivity;->lastKey:Ljava/lang/String;

    .line 403
    :goto_2
    new-instance v2, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0, v1}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda0;-><init>(Llocal/gmslogger/MainActivity;Llocal/gmslogger/LogFilter$Snapshot;Ljava/util/List;)V

    invoke-virtual {p0, v2}, Llocal/gmslogger/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$updateView$2$local-gmslogger-MainActivity(Llocal/gmslogger/LogFilter$Snapshot;Ljava/util/List;)V
    .locals 0

    .line 404
    iput-object p1, p0, Llocal/gmslogger/MainActivity;->snapshot:Llocal/gmslogger/LogFilter$Snapshot;

    .line 405
    invoke-direct {p0}, Llocal/gmslogger/MainActivity;->showFilterState()V

    if-eqz p2, :cond_0

    .line 407
    invoke-direct {p0, p2}, Llocal/gmslogger/MainActivity;->sync(Ljava/util/List;)V

    :cond_0
    const/4 p1, 0x0

    .line 409
    iput-boolean p1, p0, Llocal/gmslogger/MainActivity;->loading:Z

    return-void
.end method

.method synthetic lambda$zoom$0$local-gmslogger-MainActivity(ILandroid/view/View;)V
    .locals 0

    .line 369
    invoke-direct {p0, p1}, Llocal/gmslogger/MainActivity;->adjustFont(I)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 16

    move-object/from16 v0, p0

    .line 112
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    const-string v13, "android.permission.POST_NOTIFICATIONS"

    aput-object v13, v14, v15

    const/16 v15, 0x1

    invoke-virtual {v0, v14, v15}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 113
    new-instance v1, Ljava/io/File;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Llocal/gmslogger/MainActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    const-string v4, "filtered-log.txt"

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, v0, Llocal/gmslogger/MainActivity;->file:Ljava/io/File;

    .line 114
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0, v2}, Llocal/gmslogger/MainActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    const-string v3, "logcat-all.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, v0, Llocal/gmslogger/MainActivity;->allFile:Ljava/io/File;

    .line 116
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    .line 117
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v3, -0x1000000

    .line 118
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 119
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 120
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x20

    const/16 v6, 0x18

    .line 121
    const/16 v7, 0x48

    invoke-virtual {v4, v5, v7, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v7, -0xf5f5f6

    .line 122
    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 123
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, v0, Llocal/gmslogger/MainActivity;->state:Landroid/widget/TextView;

    const/high16 v8, 0x41c00000    # 24.0f

    .line 124
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 125
    iget-object v7, v0, Llocal/gmslogger/MainActivity;->state:Landroid/widget/TextView;

    const-string v8, "fonts/PixelOperatorMonoHB8.ttf"

    invoke-direct {v0, v8}, Llocal/gmslogger/MainActivity;->fontAsset(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 126
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 127
    const-string v8, "fonts/ChakraPetch-Light.ttf"

    invoke-direct {v0, v8}, Llocal/gmslogger/MainActivity;->fontAsset(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const v8, -0xe070e1

    .line 128
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    iget-object v9, v0, Llocal/gmslogger/MainActivity;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    new-array v10, v2, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v9, v10, v11

    const v9, 0x7f030010

    invoke-virtual {v0, v9, v10}, Llocal/gmslogger/MainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 131
    const-string v10, "fonts/ChakraPetch-Light.ttf"

    invoke-direct {v0, v10}, Llocal/gmslogger/MainActivity;->fontAsset(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 132
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setTextColor(I)V

    const v8, 0x7f03001c

    .line 133
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setText(I)V

    .line 134
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    .line 135
    invoke-virtual {v8, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 136
    iget-object v8, v0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    const/16 v10, 0x78

    invoke-direct {v0, v10}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v10

    invoke-virtual {v8, v5, v6, v5, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 137
    new-instance v8, Landroid/animation/LayoutTransition;

    invoke-direct {v8}, Landroid/animation/LayoutTransition;-><init>()V

    const-wide/16 v12, 0xdc

    .line 138
    invoke-virtual {v8, v12, v13}, Landroid/animation/LayoutTransition;->setDuration(J)V

    const/4 v10, 0x2

    .line 139
    invoke-virtual {v8, v10}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    .line 140
    iget-object v12, v0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v12, v8}, Landroid/widget/LinearLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 141
    new-instance v8, Landroid/widget/ScrollView;

    invoke-direct {v8, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 142
    invoke-virtual {v8, v3}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 143
    iget-object v12, v0, Llocal/gmslogger/MainActivity;->logBox:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v12}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 144
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 145
    invoke-virtual {v12, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v13, 0x10

    .line 146
    invoke-virtual {v12, v13}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 147
    new-instance v13, Landroid/widget/ImageButton;

    invoke-direct {v13, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    const v14, 0x7f020005

    .line 148
    invoke-virtual {v13, v14}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 149
    invoke-virtual {v13, v11}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 150
    sget-object v14, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v13, v14}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v14, 0x8

    .line 151
    invoke-direct {v0, v14}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v14}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {v0, v14}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {v0, v14}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v14

    invoke-virtual {v13, v15, v6, v3, v14}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 152
    new-instance v3, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda7;

    invoke-direct {v3, v0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda7;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-virtual {v13, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    iget-object v3, v0, Llocal/gmslogger/MainActivity;->state:Landroid/widget/TextView;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v6, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    invoke-direct {v0, v12}, Llocal/gmslogger/MainActivity;->catView(Landroid/widget/LinearLayout;)V

    .line 154
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x2c

    invoke-direct {v0, v6}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v14

    invoke-direct {v0, v6}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v2

    invoke-direct {v3, v14, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 155
    invoke-virtual {v4, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 156
    .line 157
    .line 158
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v3, -0xcc00cd

    .line 159
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 160
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 161
    invoke-direct {v0}, Llocal/gmslogger/MainActivity;->filterBar()Landroid/widget/LinearLayout;

    move-result-object v3

    iput-object v3, v0, Llocal/gmslogger/MainActivity;->filterBarView:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v4, -0x2

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v13, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v10}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v4

    const/4 v7, -0x1

    invoke-direct {v3, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    invoke-direct {v0}, Llocal/gmslogger/MainActivity;->searchBar()Landroid/widget/LinearLayout;

    move-result-object v2

    iput-object v2, v0, Llocal/gmslogger/MainActivity;->searchBar:Landroid/widget/LinearLayout;

    .line 164
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 165
    iget-boolean v4, v0, Llocal/gmslogger/MainActivity;->searchOpen:Z

    if-eqz v4, :cond_0

    const/4 v4, -0x2

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-direct {v3, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 164
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v11, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    const/16 v6, 0x30

    new-instance v2, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, v0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda8;-><init>(Llocal/gmslogger/MainActivity;)V

    const v3, 0x7f020001

    invoke-direct {v0, v3, v6, v2}, Llocal/gmslogger/MainActivity;->square(IILandroid/view/View$OnClickListener;)Landroid/widget/ImageButton;

    move-result-object v2

    const v13, -0xcc00cd

    const/high16 v14, -0x1000000

    const/16 v15, 0x30

    invoke-direct {v0, v2, v13, v14, v15}, Llocal/gmslogger/MainActivity;->restyle(Landroid/view/View;III)V

    .line 169
    new-instance v3, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda9;

    invoke-direct {v3, v0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda9;-><init>(Llocal/gmslogger/MainActivity;)V

    const v4, 0x7f020003

    const/16 v8, 0x40

    invoke-direct {v0, v4, v8, v3}, Llocal/gmslogger/MainActivity;->square(IILandroid/view/View$OnClickListener;)Landroid/widget/ImageButton;

    move-result-object v3

    iput-object v3, v0, Llocal/gmslogger/MainActivity;->toggle:Landroid/widget/ImageButton;

    const v13, -0xcc00cd

    const/high16 v14, -0x1000000

    const/16 v15, 0x40

    invoke-direct {v0, v3, v13, v14, v15}, Llocal/gmslogger/MainActivity;->restyle(Landroid/view/View;III)V

    .line 170
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 171
    const-string v4, "A-"

    invoke-direct {v0, v4, v7}, Llocal/gmslogger/MainActivity;->zoom(Ljava/lang/String;I)Landroid/widget/Button;

    move-result-object v4

    const/16 v9, 0xc

    const/16 v5, 0x28

    invoke-direct {v0, v5, v9}, Llocal/gmslogger/MainActivity;->actionParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v10

    .line 172
    const-string v4, "A+"

    const/4 v10, 0x1

    invoke-direct {v0, v4, v10}, Llocal/gmslogger/MainActivity;->zoom(Ljava/lang/String;I)Landroid/widget/Button;

    move-result-object v4

    invoke-direct {v0, v5, v9}, Llocal/gmslogger/MainActivity;->actionParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    .line 173
    new-instance v4, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda8;

    invoke-direct {v4, v0}, Llocal/gmslogger/MainActivity$$ExternalSyntheticLambda8;-><init>(Llocal/gmslogger/MainActivity;)V

    invoke-direct {v0, v4}, Llocal/gmslogger/MainActivity;->addBarIcon(Landroid/view/View$OnClickListener;)V

    .line 174
    iget-object v2, v0, Llocal/gmslogger/MainActivity;->toggle:Landroid/widget/ImageButton;

    invoke-direct {v0, v8, v11}, Llocal/gmslogger/MainActivity;->actionParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/high16 v4, -0x1000000

    .line 177
    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 178
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 179
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const v4, 0x800055

    const/4 v5, -0x2

    invoke-direct {v1, v5, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v4, 0x18

    .line 180
    invoke-direct {v0, v4}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v0, v4}, Llocal/gmslogger/MainActivity;->dp(I)I

    move-result v4

    invoke-virtual {v1, v11, v11, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 181
    invoke-virtual {v2, v3, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    invoke-virtual {v0, v2}, Llocal/gmslogger/MainActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 193
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Llocal/gmslogger/MainActivity;->refresh:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 194
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 187
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 188
    iget-object v0, p0, Llocal/gmslogger/MainActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Llocal/gmslogger/MainActivity;->refresh:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
