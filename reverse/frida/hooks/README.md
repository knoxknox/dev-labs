# hooks
Allows to modify source code of the program in runtime.<br/>
Uses 'frida-gadget' library which should be injected in the app.

Tools:
- adb
- aapt
- apktool
- zipalign
- jarsigner
- frida
- objection

You can find binaries in the `tools` folder or install them manually.<br/>
To install manually ensure that you have python/pip installed on your laptop.
```
$ brew install apktool
$ brew install android-sdk
$ cp tools/zipalign /usr/local/bin
$
$ pip install frida --upgrade
$ pip3 install objection --upgrade
```

Ensure that all tools have been installed:
```
$ adb version           # version: 1.0.32
$ aapt version          # version: 0.2-179
$ apktool -version      # version: 2.3.3
$ zipalign              # version: 2009
$ jarsigner             # version: 2017
$ frida version         # version: 12.2.26
$ objection version     # version: 1.4.3
```
```
$ ls -lsa /usr/local/bin
> rwxr-xr-x   zipalign
> rwxr-xr-x   adb -> /usr/local/Cellar/android-sdk/24.3.3/bin/adb
> rwxr-xr-x   aapt -> /usr/local/Cellar/android-sdk/24.3.3/bin/aapt
> rwxr-xr-x   apktool -> /usr/local/Cellar/apktool/2.3.3/bin/apktool

$ ls -lsa /usr/bin
> rwxr-xr-x   java -> /System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java
> rwxr-xr-x   jarsigner -> /System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/jarsigner
```

## injection
Connect your device via usb:
```
$ adb shell cat /proc/cpuinfo
$ adb shell getprop ro.product.cpu.abi
$
$ frida version | grep '\d' --color => 12.2.26
$ objection patchapk -V 12.2.26 --source /tmp/target.apk
```

Check application activities:
```
$ adb logcat | grep START
$ aapt dump badging /tmp/target.objection.apk
```

Check that frida-gadget injected:
```
$ apktool d /tmp/target.objection.apk
$ ls /tmp/target.objection/lib/armeabi-v7a/ => libfrida-gadget.so
```

Frida should start server on app launch:
```
$ adb shell netstat -ln => 27042 is a default port to connect frida
```

## inspection
After start app you can connect to it:
```
$ objection explore
>
> memory list modules
> android hooking list classes
> android hooking list activities
>
> jobs list
> import ~/Downloads/frida/hooks.js
> jobs kill aaab22d3-9b8a-456c-bbe3-6967f4435f03
>
> android intent launch_activity com.example.MyActivity
```
