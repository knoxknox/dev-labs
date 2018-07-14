.class Lcom/willhackforsushi/isitdown/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/willhackforsushi/isitdown/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/willhackforsushi/isitdown/MainActivity;


# direct methods
.method constructor <init>(Lcom/willhackforsushi/isitdown/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/willhackforsushi/isitdown/MainActivity$1;->this$0:Lcom/willhackforsushi/isitdown/MainActivity;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 49
    iget-object v1, p0, Lcom/willhackforsushi/isitdown/MainActivity$1;->this$0:Lcom/willhackforsushi/isitdown/MainActivity;

    const v2, 0x7f080003

    invoke-virtual {v1, v2}, Lcom/willhackforsushi/isitdown/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 50
    .local v0, "output":Landroid/widget/TextView;
    const-string v1, "Working ..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v1, p0, Lcom/willhackforsushi/isitdown/MainActivity$1;->this$0:Lcom/willhackforsushi/isitdown/MainActivity;

    iget-object v1, v1, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;

    const-string v2, "http://files.sec575.org/ad.gif"

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 52
    iget-object v1, p0, Lcom/willhackforsushi/isitdown/MainActivity$1;->this$0:Lcom/willhackforsushi/isitdown/MainActivity;

    invoke-virtual {v1}, Lcom/willhackforsushi/isitdown/MainActivity;->reachHost()V

    .line 53
    return-void
.end method
