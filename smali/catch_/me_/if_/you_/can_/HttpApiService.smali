.class public Lcatch_/me_/if_/you_/can_/HttpApiService;
.super Landroid/app/Service;
.source "HttpApiService.java"


# instance fields
.field serverSocket:Ljava/net/ServerSocket;

.field private serverThread:Ljava/lang/Thread;

.field private isRunning:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->isRunning:Z

    return-void
.end method

.method static synthetic access$000(Lcatch_/me_/if_/you_/can_/HttpApiService;)Z
    .locals 1
    .param p0, "x0"    # Lcatch_/me_/if_/you_/can_/HttpApiService;

    .prologue
    .line 10
    iget-boolean v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->isRunning:Z

    return v0
.end method

.method static synthetic access$100(Lcatch_/me_/if_/you_/can_/HttpApiService;Ljava/net/Socket;)V
    .locals 0
    .param p0, "x0"    # Lcatch_/me_/if_/you_/can_/HttpApiService;
    .param p1, "x1"    # Ljava/net/Socket;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleClient(Ljava/net/Socket;)V

    return-void
.end method

.method private handleClient(Ljava/net/Socket;)V
    .locals 12
    .param p1, "client"    # Ljava/net/Socket;

    .prologue
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    .local v6, "input":Ljava/io/InputStream;
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    .local v7, "output":Ljava/io/OutputStream;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .local v4, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "requestLine":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "postBody":Ljava/lang/String;
    if-eqz v5, :cond_2

    const-string v8, " "

    invoke-virtual {v5, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .local v3, "parts":[Ljava/lang/String;
    array-length v8, v3

    const/4 v9, 0x2

    if-lt v8, v9, :cond_2

    const/4 v8, 0x0

    aget-object v10, v3, v8

    .local v10, "method":Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v11, v3, v8

    .local v11, "path":Ljava/lang/String;
    const-string v8, "POST"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v0, -0x1

    :cond_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :headers_done

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-gtz v9, :check_cl

    goto :headers_done

    :check_cl
    const-string v1, "Content-Length:"

    invoke-virtual {v8, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xf

    invoke-virtual {v8, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :cond_0

    :headers_done
    if-ltz v0, :body_done

    new-array v1, v0, [C

    const/4 v9, 0x0

    :read_body_loop
    if-ge v9, v0, :body_ready

    sub-int v3, v0, v9

    invoke-virtual {v4, v1, v9, v3}, Ljava/io/BufferedReader;->read([CII)I

    move-result v3

    if-ltz v3, :body_ready

    add-int/2addr v9, v3

    goto :read_body_loop

    :body_ready
    new-instance v2, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v2, v1, v5, v9}, Ljava/lang/String;-><init>([CII)V

    :body_done
    :cond_1
    invoke-direct {p0, v11, v2}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "response":Ljava/lang/String;
    invoke-direct {p0, v7, v1}, Lcatch_/me_/if_/you_/can_/HttpApiService;->sendResponse(Ljava/io/OutputStream;Ljava/lang/String;)V

    .end local v1    # "response":Ljava/lang/String;
    .end local v3    # "parts":[Ljava/lang/String;
    .end local v10    # "method":Ljava/lang/String;
    .end local v11    # "path":Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v2    # "postBody":Ljava/lang/String;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .end local v5    # "requestLine":Ljava/lang/String;
    .end local v6    # "input":Ljava/io/InputStream;
    .end local v7    # "output":Ljava/io/OutputStream;
    :goto_0
    return-void
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    :try_start_4
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :goto_1
    throw v8

    :catch_2
    move-exception v0

    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private handleRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/String;

    .prologue
    const-string v0, "/api/status"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "{\"status\":\"running\",\"service\":\"GameGuardian HTTP API\",\"version\":\"1.0\"}"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "/api/test"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "{\"message\":\"HTTP API is working!\"}"

    goto :goto_0

    :cond_1
    const-string v0, "/api/gg/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, p1, p2}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleGGCommand(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"error\":\"Unknown endpoint\",\"path\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleGGCommand(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/String;

    .prologue
    const-string v0, "/api/gg/info"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleInfo()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "/api/gg/status"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleStatus()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "/api/gg/searchNumber"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, p2}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleSearchNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-string v0, "/api/gg/getResults"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0, p2}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleGetResults(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    const-string v0, "/api/gg/editAll"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0, p2}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleEditAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_4
    const-string v0, "/api/gg/runScript"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0, p2}, Lcatch_/me_/if_/you_/can_/HttpApiService;->handleRunScript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_5
    const-string v0, "{\"error\":\"Unknown GG command\",\"available\":[\"info\",\"status\",\"searchNumber\",\"getResults\",\"editAll\",\"runScript\"]}"

    goto :goto_0
.end method

.method private handleInfo()Ljava/lang/String;
    .locals 5

    .prologue
    :try_start_0
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    if-nez v0, :has_instance

    const-string v0, "{\"error\":\"GG not initialized\"}"

    :goto_0
    return-object v0

    :has_instance
    iget-object v1, v0, Landroid/ext/MainService;->ap:Landroid/ext/qh;

    if-nez v1, :has_target

    const-string v0, "{\"error\":\"No target process selected\"}"

    goto :goto_0

    :has_target
    iget v2, v1, Landroid/ext/qh;->f:I

    iget-object v3, v1, Landroid/ext/qh;->c:Ljava/lang/String;

    iget-object v4, v1, Landroid/ext/qh;->b:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"pid\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\"package\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"process\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"status\":\"attached\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"error\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleStatus()Ljava/lang/String;
    .locals 5

    .prologue
    :try_start_0
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    if-nez v0, :has_instance

    const-string v0, "{\"resultCount\":0,\"hasTarget\":false}"

    :goto_0
    return-object v0

    :has_instance
    iget-object v1, v0, Landroid/ext/MainService;->ap:Landroid/ext/qh;

    if-nez v1, :has_target

    const-string v0, "{\"resultCount\":0,\"hasTarget\":false}"

    goto :goto_0

    :has_target
    iget-wide v2, v0, Landroid/ext/MainService;->aj:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"resultCount\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\"hasTarget\":true}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"error\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleSearchNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    :try_start_0
    if-eqz p1, :empty_body

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :has_body

    :empty_body
    const-string v0, "{\"error\":\"Empty request body. Required: {\\\"value\\\":\\\"123\\\",\\\"type\\\":1}\"}"

    :goto_0
    return-object v0

    :has_body
    const-string v0, "value"

    invoke-direct {p0, p1, v0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->extractJsonValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :no_value

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :has_value

    :no_value
    const-string v0, "{\"error\":\"Missing value parameter\"}"

    goto :goto_0

    :has_value
    const-string v0, "type"

    invoke-direct {p0, p1, v0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->extractJsonValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :default_type

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :parse_type

    :default_type
    const/4 v2, 0x1

    :goto_1
    move-object v3, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, -0x1

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    invoke-static/range {v2 .. v13}, Landroid/ext/ra;->a(BLjava/lang/String;IZIJJZJ)Z

    move-result v0

    if-eqz v0, :search_failed

    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    if-nez v0, :has_instance

    const-string v0, "{\"success\":true,\"count\":0}"

    goto :goto_0

    :has_instance
    iget-wide v2, v0, Landroid/ext/MainService;->aj:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"success\":true,\"count\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :parse_type
    :try_start_1
    invoke-static {v0}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    goto :goto_1

    :catch_1
    move-exception v0

    const/4 v2, 0x1

    goto :goto_1

    :search_failed
    :try_start_2
    const-string v0, "{\"error\":\"Search failed. Check if target process is selected.\"}"

    goto :goto_0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"error\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method private handleGetResults(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    :try_start_0
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    if-nez v0, :has_instance

    const-string v0, "{\"error\":\"GG not initialized\"}"

    :goto_0
    return-object v0

    :has_instance
    iget-object v1, v0, Landroid/ext/MainService;->am:Landroid/c/a;

    if-nez v1, :has_results

    const-string v0, "{\"results\":[],\"count\":0}"

    goto :goto_0

    :has_results
    invoke-virtual {v1}, Landroid/c/a;->a()I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "{\"results\":["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    const/16 v5, 0x64

    if-le v2, v5, :use_all

    const/16 v2, 0x64

    :use_all
    move v5, v4

    :loop_start
    if-ge v5, v2, :loop_end

    invoke-virtual {v1, v5}, Landroid/c/a;->a(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/ext/d;

    if-eqz v6, :skip_item

    if-lez v5, :no_comma

    const-string v7, ","

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :no_comma
    const-string v7, "{\"address\":"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v6, Landroid/ext/d;->a:J

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, ",\"value\":\""

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v6, Landroid/ext/d;->b:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\"}"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :skip_item
    add-int/lit8 v5, v5, 0x1

    goto :loop_start

    :loop_end
    const-string v1, "],\"count\":"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"error\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleEditAll(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    :try_start_0
    if-eqz p1, :empty_body

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :has_body

    :empty_body
    const-string v0, "{\"error\":\"Empty request body. Required: {\\\"value\\\":\\\"123\\\"}\"}"

    :goto_0
    return-object v0

    :has_body
    const-string v0, "value"

    invoke-direct {p0, p1, v0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->extractJsonValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :no_value

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :has_value

    :no_value
    const-string v0, "{\"error\":\"Missing value parameter\"}"

    goto :goto_0

    :has_value
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    if-nez v0, :has_instance

    const-string v0, "{\"error\":\"GG not initialized\"}"

    goto :goto_0

    :has_instance
    iget-object v2, v0, Landroid/ext/MainService;->am:Landroid/c/a;

    if-nez v2, :has_results

    const-string v0, "{\"error\":\"No search results. Please search first.\"}"

    goto :goto_0

    :has_results
    invoke-virtual {v2}, Landroid/c/a;->a()I

    move-result v3

    if-nez v3, :do_edit

    const-string v0, "{\"error\":\"No search results found\"}"

    goto :goto_0

    :do_edit
    const/4 v4, 0x0

    const/4 v5, 0x0

    :edit_loop
    if-ge v5, v3, :edit_done

    invoke-virtual {v2, v5}, Landroid/c/a;->a(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/ext/d;

    if-eqz v0, :skip_edit

    iput-object v1, v0, Landroid/ext/d;->b:Ljava/lang/String;

    const/4 v6, 0x1

    iput-boolean v6, v0, Landroid/ext/d;->d:Z

    add-int/lit8 v4, v4, 0x1

    :skip_edit
    add-int/lit8 v5, v5, 0x1

    goto :edit_loop

    :edit_done
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"success\":true,\"modified\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\"total\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"error\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method private handleRunScript(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    :try_start_0
    if-eqz p1, :empty_body

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :has_body

    :empty_body
    const-string v0, "{\"error\":\"Empty request body. Required: {\\\"script\\\":\\\"gg.toast(\'test\')\\\"}\"}"

    :goto_0
    return-object v0

    :has_body
    const-string v0, "{\""

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :raw_script

    const-string v0, "script"

    invoke-direct {p0, p1, v0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->extractJsonValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :no_script

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :has_script

    :no_script
    const-string v0, "{\"error\":\"Missing script parameter\"}"

    goto :goto_0

    :raw_script
    move-object v1, p1

    :has_script
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    if-nez v0, :has_instance

    const-string v0, "{\"error\":\"GG not initialized\"}"

    goto :goto_0

    :has_instance
    const/4 v3, 0x0

    iget-object v2, v0, Landroid/ext/MainService;->d:Landroid/ext/Script;

    if-eqz v2, :use_fallback

    iget-object v3, v2, Landroid/ext/Script;->a:Lluaj/Globals;

    if-nez v3, :use_globals

    :use_fallback
    new-instance v2, Landroid/ext/Script;

    const-string v3, ""

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v3}, Landroid/ext/Script;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    iput-object v2, v0, Landroid/ext/MainService;->d:Landroid/ext/Script;

    iget-object v3, v2, Landroid/ext/Script;->a:Lluaj/Globals;

    :use_globals
    new-instance v4, Ljava/io/ByteArrayInputStream;

    const-string v0, "UTF-8"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string v5, "script"

    const-string v6, "t"

    invoke-virtual {v3, v4, v5, v6, v3}, Lluaj/Globals;->a(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lluaj/LuaValue;)Lluaj/LuaValue;

    move-result-object v0

    invoke-virtual {v0}, Lluaj/LuaValue;->Y()Lluaj/ap;

    move-result-object v1

    invoke-virtual {v1}, Lluaj/ap;->g()Lluaj/LuaValue;

    move-result-object v1

    invoke-virtual {v1}, Lluaj/LuaValue;->d_()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "{\"success\":true,\"result\":\""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz v1, :no_nil

    const-string v2, "\""

    const-string v3, "\\\\\""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    :goto_result
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :no_nil
    const-string v1, ""

    goto :goto_result
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"error\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :null_msg

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\""

    const-string v3, "\\\\\""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :null_msg
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method private extractJsonValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "json"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .local v3, "keyIndex":I
    const/4 v0, -0x1

    if-ne v3, v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ":"

    add-int/lit8 v1, v3, 0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .local v5, "colonIndex":I
    const/4 v0, -0x1

    if-ne v5, v0, :cond_1

    const-string v0, ""

    goto :goto_0

    :cond_1
    add-int/lit8 v4, v5, 0x1

    .local v4, "startIndex":I
    const-string v0, "\""

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    const-string v0, "\""

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    const-string v0, "\""

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .local v2, "endIndex":I
    :goto_1
    const/4 v0, -0x1

    if-ne v2, v0, :cond_3

    const-string v0, ""

    goto :goto_0

    .end local v2    # "endIndex":I
    :cond_2
    const-string v0, ","

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .restart local v2    # "endIndex":I
    const/4 v0, -0x1

    if-ne v2, v0, :cond_3

    const-string v0, "}"

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    goto :goto_1

    :cond_3
    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private sendResponse(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 3
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .local v1, "response":Ljava/lang/StringBuilder;
    const-string v2, "HTTP/1.1 200 OK\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Content-Type: application/json; charset=UTF-8\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Access-Control-Allow-Origin: *\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Connection: close\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .local v0, "bytes":[B
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 0

    .prologue
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-virtual {p0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->startServer()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    invoke-virtual {p0}, Lcatch_/me_/if_/you_/can_/HttpApiService;->stopServer()V

    return-void
.end method

.method public startServer()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->isRunning:Z

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcatch_/me_/if_/you_/can_/HttpApiService$1;

    invoke-direct {v1, p0}, Lcatch_/me_/if_/you_/can_/HttpApiService$1;-><init>(Lcatch_/me_/if_/you_/can_/HttpApiService;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->serverThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->serverThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public stopServer()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->isRunning:Z

    :try_start_0
    iget-object v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->serverSocket:Ljava/net/ServerSocket;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcatch_/me_/if_/you_/can_/HttpApiService;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


