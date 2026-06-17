.class final Landroid/ext/Script$hideUiButton;
.super Landroid/ext/Script$ApiFunction;
.source "src"


# instance fields
.field final synthetic d:Landroid/ext/Script;


# direct methods
.method constructor <init>(Landroid/ext/Script;)V
    .locals 0

    .prologue
    .line 2462
    iput-object p1, p0, Landroid/ext/Script$hideUiButton;->d:Landroid/ext/Script;

    invoke-direct {p0}, Landroid/ext/Script$ApiFunction;-><init>()V

    return-void
.end method


# virtual methods
.method a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2464
    const-string v0, "gg.hideUiButton() -> nil"

    return-object v0
.end method

.method public d(Lluaj/ap;)Lluaj/ap;
    .locals 2

    .prologue
    .line 2467
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/ext/MainService;->f(Z)V

    .line 2468
    sget-object v0, Landroid/ext/Script$hideUiButton;->u:Lluaj/LuaValue;

    return-object v0
.end method

.method protected m_()I
    .locals 1

    .prologue
    .line 2463
    const/4 v0, 0x0

    return v0
.end method
