.class Landroid/ext/mw;
.super Ljava/lang/Object;
.source "src"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/ext/MainService;


# direct methods
.method constructor <init>(Landroid/ext/MainService;)V
    .locals 0

    .prologue
    .line 2589
    iput-object p1, p0, Landroid/ext/mw;->a:Landroid/ext/MainService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2592
    iget-object v0, p0, Landroid/ext/mw;->a:Landroid/ext/MainService;

    invoke-virtual {v0}, Landroid/ext/MainService;->x()V

    .line 2593
    return-void
.end method
