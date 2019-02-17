# app

Setup:
```
$ git clone <project> /tmp/project
$ sh /tmp/project/goimc/scripts/setup.sh
```

Install libs:
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
