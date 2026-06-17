.class public abstract Lluaj/lib/ZeroArgFunction;
.super Lluaj/lib/LibFunction;
.source "src"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lluaj/lib/LibFunction;-><init>()V

    .line 53
    return-void
.end method


# virtual methods
.method public a(Lluaj/LuaValue;)Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Lluaj/lib/ZeroArgFunction;->l()Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method

.method public a(Lluaj/LuaValue;Lluaj/LuaValue;)Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 60
    invoke-virtual {p0}, Lluaj/lib/ZeroArgFunction;->l()Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method

.method public a(Lluaj/LuaValue;Lluaj/LuaValue;Lluaj/LuaValue;)Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 64
    invoke-virtual {p0}, Lluaj/lib/ZeroArgFunction;->l()Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method

.method public a_(Lluaj/ap;)Lluaj/ap;
    .locals 1

    .prologue
    .line 68
    invoke-virtual {p0}, Lluaj/lib/ZeroArgFunction;->l()Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method

.method public abstract l()Lluaj/LuaValue;
.end method
