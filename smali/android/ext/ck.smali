.class Landroid/ext/ck;
.super Landroid/ext/cz;
.source "src"


# direct methods
.method constructor <init>(II[IILjava/lang/String;Z)V
    .locals 0

    .prologue
    .line 226
    invoke-direct/range {p0 .. p6}, Landroid/ext/cz;-><init>(II[IILjava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .prologue
    .line 234
    invoke-static {}, Landroid/ext/lh;->g()Z

    move-result v0

    if-nez v0, :cond_0

    .line 237
    :goto_0
    return-void

    .line 236
    :cond_0
    invoke-super {p0}, Landroid/ext/cz;->d()V

    goto :goto_0
.end method
