.class public final Lluaj/LuaBoolean;
.super Lluaj/LuaValue;
.source "src"


# static fields
.field public static a:Lluaj/LuaValue;


# instance fields
.field public final b:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lluaj/LuaValue;-><init>()V

    .line 51
    iput-boolean p1, p0, Lluaj/LuaBoolean;->b:Z

    .line 52
    return-void
.end method


# virtual methods
.method public a(Z)Z
    .locals 1

    .prologue
    .line 87
    iget-boolean v0, p0, Lluaj/LuaBoolean;->b:Z

    return v0
.end method

.method public d_()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-boolean v0, p0, Lluaj/LuaBoolean;->b:Z

    if-eqz v0, :cond_0

    const-string v0, "true"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method

.method public e_()I
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x1

    return v0
.end method

.method public f_()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    const-string v0, "boolean"

    return-object v0
.end method

.method public h()Z
    .locals 1

    .prologue
    .line 91
    iget-boolean v0, p0, Lluaj/LuaBoolean;->b:Z

    return v0
.end method

.method public i()Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lluaj/LuaBoolean;->a:Lluaj/LuaValue;

    return-object v0
.end method

.method public i_()Z
    .locals 1

    .prologue
    .line 79
    iget-boolean v0, p0, Lluaj/LuaBoolean;->b:Z

    return v0
.end method

.method public k_()Lluaj/LuaValue;
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lluaj/LuaBoolean;->b:Z

    if-eqz v0, :cond_0

    sget-object v0, Lluaj/LuaBoolean;->w:Lluaj/LuaBoolean;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lluaj/LuaValue;->v:Lluaj/LuaBoolean;

    goto :goto_0
.end method

.method public n_()Z
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x1

    return v0
.end method
