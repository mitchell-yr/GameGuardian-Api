.class Landroid/ext/hz;
.super Ljava/lang/Object;
.source "src"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/DialogInterface$OnShowListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field final synthetic a:Landroid/ext/hy;

.field private b:Landroid/app/AlertDialog;

.field private c:Landroid/widget/EditText;

.field private d:Landroid/widget/EditText;

.field private e:Landroid/widget/CheckBox;

.field private f:Landroid/widget/CheckBox;

.field private g:Landroid/widget/CheckBox;

.field private h:Landroid/widget/Button;

.field private i:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/ext/hy;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Landroid/ext/hz;->a:Landroid/ext/hy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/ext/hy;Landroid/ext/hz;)V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0, p1}, Landroid/ext/hz;-><init>(Landroid/ext/hy;)V

    return-void
.end method

.method private a()V
    .locals 3

    .prologue
    .line 107
    sget-boolean v1, Landroid/ext/hy;->a:Z

    .line 108
    iget-object v2, p0, Landroid/ext/hz;->h:Landroid/widget/Button;

    .line 109
    if-eqz v1, :cond_0

    const v0, 0x7f070157

    :goto_0
    invoke-static {v0}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 110
    iget-object v2, p0, Landroid/ext/hz;->i:Landroid/view/View;

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 111
    return-void

    .line 109
    :cond_0
    const v0, 0x7f070156

    goto :goto_0

    .line 110
    :cond_1
    const/16 v0, 0x8

    goto :goto_1
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    .prologue
    const/4 v4, 0x4

    .line 58
    iget-object v0, p0, Landroid/ext/hz;->e:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Landroid/ext/hy;->b:Z

    .line 59
    iget-object v0, p0, Landroid/ext/hz;->f:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Landroid/ext/hy;->c:Z

    .line 60
    iget-object v0, p0, Landroid/ext/hz;->g:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Landroid/ext/hy;->d:Z

    .line 61
    const/4 v0, 0x0

    .line 62
    iget-object v1, p0, Landroid/ext/hz;->d:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 63
    sget-boolean v2, Landroid/ext/hy;->a:Z

    if-eqz v2, :cond_4

    .line 64
    invoke-static {v1}, Landroid/ext/Tools;->o(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 66
    :cond_1
    sget-boolean v2, Landroid/ext/hy;->b:Z

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    .line 67
    :cond_2
    sget-boolean v2, Landroid/ext/hy;->c:Z

    if-eqz v2, :cond_3

    or-int/lit8 v0, v0, 0x2

    .line 68
    :cond_3
    sget-boolean v2, Landroid/ext/hy;->d:Z

    if-eqz v2, :cond_4

    or-int/lit8 v0, v0, 0x4

    .line 70
    :cond_4
    invoke-static {v1, v4}, Landroid/ext/iw;->a(Ljava/lang/String;I)V

    .line 72
    iget-object v2, p0, Landroid/ext/hz;->c:Landroid/widget/EditText;

    .line 73
    if-eqz v2, :cond_0

    .line 74
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 75
    invoke-static {v2}, Landroid/ext/Tools;->o(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {v2}, Landroid/ext/Tools;->b(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 76
    invoke-static {v2, v4}, Landroid/ext/iw;->a(Ljava/lang/String;I)V

    .line 78
    sget-object v3, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    iget-object v3, v3, Landroid/ext/MainService;->d:Landroid/ext/Script;

    if-eqz v3, :cond_5

    .line 79
    invoke-static {}, Landroid/ext/i;->c()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 80
    const v1, 0x7f0700ae

    invoke-static {v1}, Landroid/ext/Tools;->d(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 81
    const v1, 0x7f070218

    invoke-static {v1}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 82
    const v1, 0x7f070219

    invoke-static {v1}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/ext/ia;

    invoke-direct {v2, p0, p2}, Landroid/ext/ia;-><init>(Landroid/ext/hz;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 90
    const v1, 0x7f07009c

    invoke-static {v1}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 79
    invoke-static {v0}, Landroid/ext/i;->a(Landroid/app/AlertDialog$Builder;)V

    goto :goto_0

    .line 94
    :cond_5
    sget-object v3, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    invoke-virtual {v3, v2, v0, v1}, Landroid/ext/MainService;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 96
    iget-object v0, p0, Landroid/ext/hz;->b:Landroid/app/AlertDialog;

    invoke-static {v0}, Landroid/ext/Tools;->a(Landroid/content/DialogInterface;)V

    .line 98
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    iget-object v0, v0, Landroid/ext/MainService;->h:Landroid/ext/qm;

    .line 99
    if-eqz v0, :cond_0

    .line 100
    const-string v1, "loadfile("

    invoke-virtual {v0, v1}, Landroid/ext/qm;->write(Ljava/lang/String;)V

    .line 101
    invoke-static {v0, v2}, Landroid/ext/Script$Consts;->a(Ljava/io/Writer;Ljava/lang/String;)Z

    .line 102
    const-string v1, ")()\n"

    invoke-virtual {v0, v1}, Landroid/ext/qm;->write(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 115
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Landroid/ext/pj;

    if-eqz v0, :cond_2

    .line 116
    :cond_0
    sget-object v0, Landroid/ext/MainService;->instance:Landroid/ext/MainService;

    iget-object v0, v0, Landroid/ext/MainService;->k:Landroid/ext/ex;

    invoke-virtual {v0}, Landroid/ext/ex;->y()Z

    move-result v0

    if-nez v0, :cond_1

    .line 207
    :goto_0
    return-void

    .line 120
    :cond_1
    const v0, 0x7f040003

    invoke-static {v0, v3}, Landroid/fix/i;->a(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 122
    const v0, 0x7f0b000e

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 123
    const v5, 0x7f070216

    invoke-static {v5}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    const v0, 0x7f0b000f

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/ext/EditTextPath;

    .line 126
    iput-object v0, p0, Landroid/ext/hz;->c:Landroid/widget/EditText;

    .line 127
    const-string v5, "script-path"

    const-string v6, "-script"

    const-string v7, ".lua"

    invoke-static {v5, v6, v7}, Landroid/ext/qd;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/ext/EditTextPath;->setText(Ljava/lang/CharSequence;)V

    .line 128
    invoke-virtual {v0, v8}, Landroid/ext/EditTextPath;->setDataType(I)V

    .line 129
    invoke-virtual {v0, v1}, Landroid/ext/EditTextPath;->setPathType(I)V

    .line 131
    const v1, 0x7f0b0010

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 133
    const v1, 0x7f0b0011

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-static {v1}, Landroid/ext/Config;->a(Landroid/widget/ImageView;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    const v1, 0x7f0b0012

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 136
    new-instance v5, Landroid/ext/be;

    const-string v6, "kwws=22jdphjxdugldq1qhw2iruxp2ilohv2fdwhjru|290oxd0vfulswv2"

    invoke-direct {v5, v6}, Landroid/ext/be;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    const v1, 0x7f0b0013

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 139
    new-instance v5, Landroid/ext/be;

    const-string v6, "kwws=22jdphjxdugldq1qhw2khos2"

    invoke-direct {v5, v6}, Landroid/ext/be;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    const v1, 0x7f0b0014

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    const v1, 0x7f0b0015

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Landroid/ext/hz;->i:Landroid/view/View;

    .line 145
    const v1, 0x7f0b000a

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/ext/EditTextPath;

    .line 146
    iput-object v1, p0, Landroid/ext/hz;->d:Landroid/widget/EditText;

    .line 147
    const-string v5, "script-debug"

    invoke-static {v3, v5}, Landroid/ext/qd;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/ext/EditTextPath;->setText(Ljava/lang/CharSequence;)V

    .line 148
    invoke-virtual {v1, v8}, Landroid/ext/EditTextPath;->setDataType(I)V

    .line 149
    invoke-virtual {v1, v2}, Landroid/ext/EditTextPath;->setPathType(I)V

    .line 150
    const v5, 0x7f0b000b

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 152
    const v1, 0x7f0b0016

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Landroid/ext/hz;->e:Landroid/widget/CheckBox;

    .line 153
    sget-boolean v5, Landroid/ext/hy;->b:Z

    invoke-virtual {v1, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 154
    invoke-static {v1}, Landroid/ext/Tools;->j(Landroid/view/View;)V

    .line 155
    invoke-virtual {v1, p0}, Landroid/widget/CheckBox;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 156
    const v1, 0x7f0b0017

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Landroid/ext/hz;->f:Landroid/widget/CheckBox;

    .line 157
    sget-boolean v5, Landroid/ext/hy;->c:Z

    invoke-virtual {v1, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 158
    const v1, 0x7f0b0018

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Landroid/ext/hz;->g:Landroid/widget/CheckBox;

    .line 159
    sget-boolean v5, Landroid/ext/hy;->d:Z

    invoke-virtual {v1, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 161
    const v1, 0x7f0b0019

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Landroid/ext/hz;->h:Landroid/widget/Button;

    .line 162
    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    invoke-direct {p0}, Landroid/ext/hz;->a()V

    .line 166
    invoke-static {}, Landroid/ext/i;->c()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 167
    invoke-static {v4, v2}, Landroid/ext/InternalKeyboard;->c(Landroid/view/View;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 168
    const v2, 0x7f070217

    invoke-static {v2}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 169
    const v2, 0x7f0700a1

    invoke-static {v2}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 170
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 171
    invoke-static {v1, p0}, Landroid/ext/i;->a(Landroid/app/AlertDialog;Landroid/content/DialogInterface$OnShowListener;)V

    .line 172
    invoke-static {v1, p0}, Landroid/ext/i;->a(Landroid/app/AlertDialog;Landroid/content/DialogInterface$OnDismissListener;)V

    .line 173
    iput-object v1, p0, Landroid/ext/hz;->b:Landroid/app/AlertDialog;

    .line 174
    invoke-static {v1, v0}, Landroid/ext/i;->a(Landroid/app/AlertDialog;Landroid/widget/EditText;)Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 176
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 202
    const/4 v0, -0x1

    invoke-virtual {p0, v3, v0}, Landroid/ext/hz;->onClick(Landroid/content/DialogInterface;I)V

    goto/16 :goto_0

    .line 178
    :sswitch_0
    sget-boolean v0, Landroid/ext/hy;->a:Z

    if-eqz v0, :cond_3

    move v0, v2

    :goto_1
    sput-boolean v0, Landroid/ext/hy;->a:Z

    .line 179
    invoke-direct {p0}, Landroid/ext/hz;->a()V

    goto/16 :goto_0

    :cond_3
    move v0, v1

    .line 178
    goto :goto_1

    .line 184
    :sswitch_1
    new-instance v4, Ljava/io/File;

    invoke-static {}, Landroid/ext/Tools;->r()Ljava/lang/String;

    move-result-object v0

    const-string v5, "help.zip"

    invoke-direct {v4, v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    :try_start_0
    const-string v0, "he"

    invoke-static {v0, v4}, Landroid/ext/Tools;->a(Ljava/lang/String;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    .line 190
    :goto_2
    invoke-static {}, Landroid/ext/i;->c()Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 191
    const v6, 0x7f070245

    invoke-static {v6}, Landroid/ext/Tools;->d(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 192
    if-nez v0, :cond_4

    const v0, 0x7f070246

    invoke-static {v0}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v1}, Landroid/ext/Tools;->a(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {v5, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 194
    const v1, 0x7f07009d

    invoke-static {v1}, Landroid/ext/qk;->a(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 190
    invoke-static {v0}, Landroid/ext/i;->a(Landroid/app/AlertDialog$Builder;)V

    goto/16 :goto_0

    .line 187
    :catch_0
    move-exception v0

    .line 188
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 193
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    const v2, 0x7f070247

    invoke-static {v2}, Landroid/ext/Tools;->c(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 198
    :sswitch_2
    new-instance v0, Landroid/ext/Script;

    const-string v1, "print(\'gg =\', gg)"

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Landroid/ext/Script;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v0}, Landroid/ext/Script;->c_()Landroid/ext/Script;

    goto/16 :goto_0

    .line 176
    :sswitch_data_0
    .sparse-switch
        0x7f0b0011 -> :sswitch_2
        0x7f0b0014 -> :sswitch_1
        0x7f0b0019 -> :sswitch_0
    .end sparse-switch
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 4

    .prologue
    .line 223
    iget-object v0, p0, Landroid/ext/hz;->c:Landroid/widget/EditText;

    .line 224
    if-eqz v0, :cond_0

    .line 225
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "script-path"

    const-string v2, "-script"

    const-string v3, ".lua"

    invoke-static {v0, v1, v2, v3}, Landroid/ext/qd;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    :cond_0
    iget-object v0, p0, Landroid/ext/hz;->d:Landroid/widget/EditText;

    .line 228
    if-eqz v0, :cond_1

    .line 229
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "script-debug"

    invoke-static {v0, v1}, Landroid/ext/qd;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 231
    :cond_1
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 211
    if-nez p1, :cond_0

    .line 218
    :goto_0
    return v0

    .line 212
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 214
    :pswitch_0
    const v0, 0x7f070342

    invoke-static {v0}, Landroid/ext/ConfigListAdapter;->b(I)V

    .line 215
    const/4 v0, 0x1

    goto :goto_0

    .line 212
    :pswitch_data_0
    .packed-switch 0x7f0b0016
        :pswitch_0
    .end packed-switch
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .locals 2

    .prologue
    .line 53
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-static {p1, v0, v1, p0}, Landroid/ext/Tools;->a(Landroid/content/DialogInterface;ILjava/lang/Object;Landroid/view/View$OnClickListener;)Z

    .line 54
    return-void
.end method
