.class Landroid/app/ANRManagerProxy;
.super Ljava/lang/Object;
.source "src"


# instance fields
.field private a:Landroid/os/IBinder;


# direct methods
.method public constructor <init>(Landroid/os/IBinder;)V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Landroid/app/ANRManagerProxy;->a:Landroid/os/IBinder;

    .line 10
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Landroid/app/ANRManagerProxy;->a:Landroid/os/IBinder;

    return-object v0
.end method

.method public informMessageDump(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 55
    return-void
.end method

.method public notifyLightWeightANR(ILjava/lang/String;I)V
    .locals 0

    .prologue
    .line 46
    return-void
.end method

.method public notifyWNR(ILjava/lang/String;)Z
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x1

    return v0
.end method
