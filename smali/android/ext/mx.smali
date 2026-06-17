.class Landroid/ext/mx;
.super Ljava/lang/Object;
.source "src"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Landroid/ext/MainService;


# direct methods
.method constructor <init>(Landroid/ext/MainService;)V
    .locals 0

    .prologue
    .line 2639
    iput-object p1, p0, Landroid/ext/mx;->a:Landroid/ext/MainService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .prologue
    .line 2642
    iget-object v0, p0, Landroid/ext/mx;->a:Landroid/ext/MainService;

    invoke-virtual {v0}, Landroid/ext/MainService;->p()V

    .line 2643
    return-void
.end method
