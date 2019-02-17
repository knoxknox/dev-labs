# app

Install golang (see docs/install.md).<br/>
Makefile contains all commands to work with app.

Setup:
```
~/workspace/src/app $ make init
~/workspace/src/app $ make deps
```

Run app/tests:
```
~/workspace/src/app $ make run
~/workspace/src/app $ make test
```

Debug app/tests:
```
import "runtime"
runtime.Breakpoint()
```
```
~/workspace/src/app $ make debug
```
