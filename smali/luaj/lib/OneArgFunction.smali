.class public abstract Lluaj/lib/OneArgFunction;
.super Lluaj/lib/LibFunction;
.source "src"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Lluaj/lib/LibFunction;-><init>()V

    .line 55
    return-void
.end method


# virtual methods
.method public abstract a(Lluaj/LuaValue;)Lluaj/LuaValue;
.end method

.method public final a(Lluaj/LuaValue;Lluaj/LuaValue;)Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 62
    invoke-virtual {p0, p1}, Lluaj/lib/OneArgFunction;->a(Lluaj/LuaValue;)Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method

.method public a(Lluaj/LuaValue;Lluaj/LuaValue;Lluaj/LuaValue;)Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lluaj/lib/OneArgFunction;->a(Lluaj/LuaValue;)Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method

.method public a_(Lluaj/ap;)Lluaj/ap;
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p1}, Lluaj/ap;->g()Lluaj/LuaValue;

    move-result-object v0

    invoke-virtual {p0, v0}, Lluaj/lib/OneArgFunction;->a(Lluaj/LuaValue;)Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method

.method public final l()Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lluaj/lib/OneArgFunction;->u:Lluaj/LuaValue;

    invoke-virtual {p0, v0}, Lluaj/lib/OneArgFunction;->a(Lluaj/LuaValue;)Lluaj/LuaValue;

    move-result-object v0

    return-object v0
.end method
