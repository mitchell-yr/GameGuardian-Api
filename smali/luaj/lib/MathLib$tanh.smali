.class final Lluaj/lib/MathLib$tanh;
.super Lluaj/lib/MathLib$UnaryOp;
.source "src"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 332
    invoke-direct {p0}, Lluaj/lib/MathLib$UnaryOp;-><init>()V

    return-void
.end method


# virtual methods
.method protected a(D)D
    .locals 3

    .prologue
    .line 332
    invoke-static {p1, p2}, Ljava/lang/Math;->tanh(D)D

    move-result-wide v0

    return-wide v0
.end method
