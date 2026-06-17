.class final Landroid/ext/Script$clearResults;
.super Landroid/ext/Script$ApiFunction;
.source "src"


# instance fields
.field final synthetic d:Landroid/ext/Script;


# direct methods
.method constructor <init>(Landroid/ext/Script;)V
    .locals 0

    .prologue
    .line 3811
    iput-object p1, p0, Landroid/ext/Script$clearResults;->d:Landroid/ext/Script;

    invoke-direct {p0}, Landroid/ext/Script$ApiFunction;-><init>()V

    return-void
.end method


# virtual methods
.method a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 3813
    const-string v0, "gg.clearResults() -> nil"

    return-object v0
.end method

.method public d(Lluaj/ap;)Lluaj/ap;
    .locals 2

    .prologue
    .line 3816
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    iget-object v1, p0, Landroid/ext/Script$clearResults;->d:Landroid/ext/Script;

    invoke-virtual {v1}, Landroid/ext/Script;->a()B

    move-result v1

    invoke-virtual {v0, v1}, Landroid/ext/MainService;->a(B)V

    .line 3817
    sget-object v0, Lluaj/LuaValue;->u:Lluaj/LuaValue;

    return-object v0
.end method

.method protected m_()I
    .locals 1

    .prologue
    .line 3812
    const/4 v0, 0x0

    return v0
.end method
