.class public Lcom/willhackforsushi/isitdown/MainActivity$JavaScriptInterface;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/willhackforsushi/isitdown/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "JavaScriptInterface"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/willhackforsushi/isitdown/MainActivity;


# direct methods
.method public constructor <init>(Lcom/willhackforsushi/isitdown/MainActivity;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/willhackforsushi/isitdown/MainActivity$JavaScriptInterface;->this$0:Lcom/willhackforsushi/isitdown/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    const-string v0, "irrelevant content"

    return-object v0
.end method
