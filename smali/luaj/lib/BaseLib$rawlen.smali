.class final Lluaj/lib/BaseLib$rawlen;
.super Lluaj/lib/LibFunction;
.source "src"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 537
    invoke-direct {p0}, Lluaj/lib/LibFunction;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lluaj/LuaValue;)Lluaj/LuaValue;
    .locals 2

    .prologue
    .line 540
    invoke-virtual {p1}, Lluaj/LuaValue;->M()I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Lluaj/lib/BaseLib$rawlen;->d(J)Lluaj/LuaLong;

    move-result-object v0

    return-object v0
.end method
