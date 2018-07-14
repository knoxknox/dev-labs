# Modifying Android Apps

Based on SEC-575 (https://pen-testing.sans.org/blog).<br/>
Target app: http://www.willhackforsushi.com/sec575/IsItDown.apk.

## Tutorial

Decode app
```
$ java -jar apktool.jar d IsItDown.apk
```

MainActivity.smali
```
348  .line 104
349  .local v7, "output":Landroid/widget/TextView;
350  invoke-static {}, Lcom/willhackforsushi/isitdown/MainActivity;->isEmulator()Z
351
352  move-result v13
353
354  if-eqz v13, :cond_0
355
356  .line 105
357  const-string v13, "No emulator use permitted. Go away."
358
359  invoke-virtual {v7, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
360
361  .line 152
362  :goto_0
363  return-void
364
365  .line 112
366  :cond_0
367  const/high16 v13, 0x7f080000
```

Smali registers:
- local registers: v0, v1, etc..
- parameter registers: p0, p1, etc.. (method args)

Smali object types:
- I = Int
- B = Byte
- C = Char
- V = Void
- F = Float
- S = Short
- L = Object
- Z = Boolean
- J = Long (64-bits)
- D = Double (64-bits)

Dalvik common instructions:
```
const vx, lit32              Puts the integer constant into vx
invoke-super {p}, method     Invokes a method of the immediate parent class
invoke-direct {p}, method    Invokes a method with the specified parameters
invoke-virtual {p}, method   Invokes a method with the specified parameters
new-instance vx, type        Instantiates an object of type, referenced in vx
move vx, vy                  Move the content of vy into vx
if-eqz vx, target            Skips to target if vx is equal to zero
if-nez vx, target            Skips to target if vx is not equal to zero
move-result vx               Move the return value of the previous method into vx
check-cast vx, type_id       Checks if the references in vx matches the specified type
```
Opcodes: http://pallergabor.uw.hu/androidblog/dalvik_opcodes.html

MainActivity.smali
```
348  .line 104
349  .local v7, "output":Landroid/widget/TextView;
350  invoke-static {}, Lcom/willhackforsushi/isitdown/MainActivity;->isEmulator()Z
351
352  move-result v13
353
354  if-eqz v13, :cond_0
355
356  .line 105
357  const-string v13, "No emulator use permitted. Go away."
```
Line 350 invokes a method `isEmulator` which returns a boolean value.<br/>
The boolean result is moved to the v13 register, and then if-eqz opcode determines if value is 0.<br/>
If v13 is equal to 0, then the code jumps to the code_0 block. Otherwise, we get message from line 357.

How to change this
```
352  move-result v13
353
354  if-eqz v13, :cond_0
355  if-nez v13, :cond_0
```
Now, the code behaves as if it the device were not an emulator, jumping to the cond_0 block.

Next step is removing the banner ad
```
267  .line 42
268  iget-object v2, p0, Lcom/willhackforsushi/isitdown/MainActivity;->wv:Landroid/webkit/WebView;
269
270  const-string v3, "http://files.sec575.org/ad.gif"
271
272  invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
273
274  .line 44
275  const v2, 0x7f080001
```
Line 268 loads the reference to the WebView in the v2 parameter.<br/>
While line 270 loads the ad url in the v3 parameter. Line 272 loads content into WebView.

How to change this
```
271  # This comment prevents to load ad into WebView
272  # invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
```
