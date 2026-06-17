.class Lcatch_/me_/if_/you_/can_/HttpApiService$1$1;
.super Ljava/lang/Object;
.source "HttpApiService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcatch_/me_/if_/you_/can_/HttpApiService$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcatch_/me_/if_/you_/can_/HttpApiService$1;

.field final synthetic val$clientSocket:Ljava/net/Socket;


# direct methods
.method constructor <init>(Lcatch_/me_/if_/you_/can_/HttpApiService$1;Ljava/net/Socket;)V
    .locals 0
    .param p1, "this$1"    # Lcatch_/me_/if_/you_/can_/HttpApiService$1;

    .prologue
    .line 46
    iput-object p1, p0, Lcatch_/me_/if_/you_/can_/HttpApiService$1$1;->this$1:Lcatch_/me_/if_/you_/can_/HttpApiService$1;

    iput-object p2, p0, Lcatch_/me_/if_/you_/can_/HttpApiService$1$1;->val$clientSocket:Ljava/net/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 49
    iget-object v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService$1$1;->this$1:Lcatch_/me_/if_/you_/can_/HttpApiService$1;

    iget-object v0, v0, Lcatch_/me_/if_/you_/can_/HttpApiService$1;->this$0:Lcatch_/me_/if_/you_/can_/HttpApiService;

    iget-object v1, p0, Lcatch_/me_/if_/you_/can_/HttpApiService$1$1;->val$clientSocket:Ljava/net/Socket;

    invoke-static {v0, v1}, Lcatch_/me_/if_/you_/can_/HttpApiService;->access$100(Lcatch_/me_/if_/you_/can_/HttpApiService;Ljava/net/Socket;)V

    .line 50
    return-void
.end method
