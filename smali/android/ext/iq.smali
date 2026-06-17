.class Landroid/ext/iq;
.super Ljava/lang/Object;
.source "src"


# instance fields
.field a:J

.field b:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 1

    .prologue
    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    iput-wide p1, p0, Landroid/ext/iq;->a:J

    .line 116
    iput-wide p3, p0, Landroid/ext/iq;->b:J

    .line 117
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 3

    .prologue
    .line 119
    iget-wide v0, p0, Landroid/ext/iq;->a:J

    const/16 v2, 0x20

    invoke-static {v0, v1, v2}, Landroid/ext/d;->b(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public b()J
    .locals 2

    .prologue
    .line 122
    iget-wide v0, p0, Landroid/ext/iq;->b:J

    return-wide v0
.end method
