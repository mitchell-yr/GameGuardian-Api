.class Landroid/ext/bu;
.super Ljava/lang/Object;
.source "src"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/ext/bq;


# direct methods
.method constructor <init>(Landroid/ext/bq;)V
    .locals 0

    .prologue
    .line 272
    iput-object p1, p0, Landroid/ext/bu;->a:Landroid/ext/bq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Landroid/ext/bu;->a:Landroid/ext/bq;

    invoke-virtual {v0}, Landroid/ext/bq;->c()V

    .line 276
    return-void
.end method
