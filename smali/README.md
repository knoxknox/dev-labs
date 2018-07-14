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
