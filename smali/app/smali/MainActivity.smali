.class public Lcom/willhackforsushi/isitdown/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/willhackforsushi/isitdown/MainActivity$JavaScriptInterface;
    }
.end annotation


# instance fields
.field wv:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private static getProperty(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 90
    const-string v0, "get"

    new-array v1, v4, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-virtual {p0, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 91
    new-array v1, v4, [Ljava/lang/Object;

    aput-object p1, v1, v3

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 90
    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static isEmulator()Z
    .locals 9

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 68
    :try_start_0
    const-string v7, "android.os.SystemProperties"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 70
    .local v4, "systemPropertyClazz":Ljava/lang/Class;
    sget-object v7, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v8, "generic"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 72
    .local v0, "genericBrand":Z
    const-string v7, "ro.kernel.qemu"

    .line 71
    invoke-static {v4, v7}, Lcom/willhackforsushi/isitdown/MainActivity;->getProperty(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 72
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    .line 71
    if-lez v7, :cond_1

    move v2, v5

    .line 74
    .local v2, "kernelQemu":Z
    :goto_0
    const-string v7, "ro.hardware"

    .line 73
    invoke-static {v4, v7}, Lcom/willhackforsushi/isitdown/MainActivity;->getProperty(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 74
    const-string v8, "goldfish"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 76
    .local v1, "hardwareGoldfish":Z
    const-string v7, "ro.product.model"

    .line 75
    invoke-static {v4, v7}, Lcom/willhackforsushi/isitdown/MainActivity;->getProperty(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 76
    const-string v8, "sdk"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 78
    .local v3, "modelSdk":Z
    if-nez v2, :cond_0

    if-nez v1, :cond_0

    if-nez v3, :cond_0

    if-eqz v0, :cond_2

    .line 85
    .end local v0    # "genericBrand":Z
    .end local v1    # "hardwareGoldfish":Z
    .end local v2    # "kernelQemu":Z
    .end local v3    # "modelSdk":Z
    :cond_0
    :goto_1
    return v5

    .restart local v0    # "genericBrand":Z
    :cond_1
    move v2, v6

    .line 71
    goto :goto_0

    .line 82
    .end local v0    # "genericBrand":Z
    :catch_0
    move-exception v5

    :cond_2
    move v5, v6

    .line 85
    goto :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const/high16 v2, 0x7f030000

    invoke-virtual {p0, v2}, Lcom/willhackforsushi/isitdown/MainActivity;->setContentView(I)V

    .line 34
    new-instance v2, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 35
    .local v1, "policy":Landroid/os/StrictMode$ThreadPolicy;
    invoke-static {v1}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 37
    const v2, 0x7f080004

    invoke-virtual {p0, v2}, Lcom/willhackforsushi/isitdown/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/webkit/WebView;

    iput-object v2, p0, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;

    .line 38
    iget-object v2, p0, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 39
    iget-object v2, p0, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 40
    iget-object v2, p0, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 41
    iget-object v2, p0, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;

    new-instance v3, Lcom/willhackforsushi/isitdown/MainActivity$JavaScriptInterface;

    invoke-direct {v3, p0}, Lcom/willhackforsushi/isitdown/MainActivity$JavaScriptInterface;-><init>(Lcom/willhackforsushi/isitdown/MainActivity;)V

    const-string v4, "JavaScriptInterface"

    invoke-virtual {v2, v3, v4}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    iget-object v2, p0, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;

    const-string v3, "http://files.sec575.org/ad.gif"

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 44
    const v2, 0x7f080001

    invoke-virtual {p0, v2}, Lcom/willhackforsushi/isitdown/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 45
    .local v0, "button":Landroid/widget/Button;
    new-instance v2, Lcom/willhackforsushi/isitdown/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/willhackforsushi/isitdown/MainActivity$1;-><init>(Lcom/willhackforsushi/isitdown/MainActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/willhackforsushi/isitdown/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 159
    const/4 v0, 0x1

    return v0
.end method

.method public reachHost()V
    .locals 15

    .prologue
    .line 95
    const/4 v3, 0x0

    .line 96
    .local v3, "exists":Z
    const-string v11, ""

    .line 97
    .local v11, "target":Ljava/lang/String;
    const-string v4, ""

    .line 98
    .local v4, "hostname":Ljava/lang/String;
    const/4 v5, 0x0

    .line 99
    .local v5, "ip":Ljava/net/InetAddress;
    const/16 v8, 0x50

    .line 102
    .local v8, "port":I
    const v13, 0x7f080003

    invoke-virtual {p0, v13}, Lcom/willhackforsushi/isitdown/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 104
    .local v7, "output":Landroid/widget/TextView;
    invoke-static {}, Lcom/willhackforsushi/isitdown/MainActivity;->isEmulator()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 105
    const-string v13, "No emulator use permitted. Go away."

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    :goto_0
    return-void

    .line 112
    :cond_0
    const/high16 v13, 0x7f080000

    invoke-virtual {p0, v13}, Lcom/willhackforsushi/isitdown/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    .line 113
    .local v6, "mEdit":Landroid/widget/EditText;
    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v13

    invoke-interface {v13}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v11

    .line 114
    const-string v13, ":"

    invoke-virtual {v11, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "designation":[Ljava/lang/String;
    array-length v13, v0

    const/4 v14, 0x1

    if-ne v13, v14, :cond_2

    .line 117
    const/4 v13, 0x0

    aget-object v4, v0, v13

    .line 118
    const/16 v8, 0x50

    .line 125
    :cond_1
    :goto_1
    :try_start_0
    invoke-static {v4}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 133
    :goto_2
    :try_start_1
    new-instance v10, Ljava/net/InetSocketAddress;

    invoke-direct {v10, v5, v8}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 135
    .local v10, "sockaddr":Ljava/net/SocketAddress;
    new-instance v9, Ljava/net/Socket;

    invoke-direct {v9}, Ljava/net/Socket;-><init>()V

    .line 139
    .local v9, "sock":Ljava/net/Socket;
    const/16 v12, 0x7d0

    .line 140
    .local v12, "timeoutMs":I
    invoke-virtual {v9, v10, v12}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 141
    const/4 v3, 0x1

    .line 147
    .end local v9    # "sock":Ljava/net/Socket;
    .end local v10    # "sockaddr":Ljava/net/SocketAddress;
    .end local v12    # "timeoutMs":I
    :goto_3
    if-eqz v3, :cond_3

    .line 148
    const-string v13, "Nah, it\'s up."

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 119
    :cond_2
    array-length v13, v0

    const/4 v14, 0x2

    if-ne v13, v14, :cond_1

    .line 120
    const/4 v13, 0x0

    aget-object v4, v0, v13

    .line 121
    const/4 v13, 0x1

    aget-object v13, v0, v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    goto :goto_1

    .line 126
    :catch_0
    move-exception v2

    .line 128
    .local v2, "e1":Ljava/net/UnknownHostException;
    invoke-virtual {v2}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_2

    .line 142
    .end local v2    # "e1":Ljava/net/UnknownHostException;
    :catch_1
    move-exception v1

    .line 143
    .local v1, "e":Ljava/lang/Exception;
    const-string v13, "ISITDOWN"

    const-string v14, "Exception"

    invoke-static {v13, v14, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 150
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    const-string v13, "Yup, it\'s down."

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
