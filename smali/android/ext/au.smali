.class Landroid/ext/au;
.super Ljava/lang/Object;
.source "src"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1219
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    invoke-virtual {v0}, Landroid/ext/MainService;->d()V

    .line 1220
    return-void
.end method
