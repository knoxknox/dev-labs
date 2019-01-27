# sniffer
This doc will help to understand how to capture traffic from device.<br/>
It contains various tools and custom scripts to do this. Based for SSL-pinning.

Tools:
- frida
- logcat
- python
- mitmproxy
- frida-server
- android sdk/tools

For Lookout apk you can capture some requests via logcat.
```
$ ANDROID_SDK_ROOT=~/Library/Android/sdk emulator -avd an60
$ adb logcat | grep 'rest-client' | python scripts/logcat.py
```
This will work but it shows only some requests, not all requests from app.

## capture all requests
To capture all requests execute next steps.

1) Install packages
```
$ brew install xz
$ brew install python
$ brew install mitmproxy
$ brew install android-sdk
$
$ pip install frida
$ wget https://github.com/frida/frida/releases/download/12.2.26/frida-server-12.2.26-android-x86.xz
```

2) Create new emulator
```
$ cd ~/Library/Android/sdk/tools && ./android (tools > manage avd)
```

3) Copy CA certificate to device
```
// emulator
$ adb push ~/.mitmproxy/mitmproxy-ca-cert.cer /sdcard/

// real-device
$ adb push ~/.mitmproxy/mitmproxy-ca-cert.cer /sdcard/Download/
```

4) Setup CA certificate to device
```
// emulator
Settings > Security > Install from SD card

// real-device
Settings > Security > Install from storage (/Download)
Settings > Wi-Fi > Long tap on connection > Modify network
Connect to your network via proxy: 192.168.0.100 (port 8080)
```

5) Run emulator
```
$ ANDROID_SDK_ROOT=~/Library/Android/sdk emulator -avd an60 -http-proxy localhost:8080
```

6) Run frida-server
```
$ xz -d frida-server-12.2.26-android-x86.xz
$ mv frida-server-12.2.26-android-x86 frida-server
```
```
$ adb push frida-server /data/local/tmp/frida-server
$ adb shell "chmod 755 /data/local/tmp/frida-server"
$ echo 'Listen...' && adb shell "/data/local/tmp/frida-server &"
```

7) Install app to device
```
$ adb install -r ~/Documents/build/debug-10.20-c24aa5f0.apk
```

8) Start proxy for HTTP(S)
```
$ mitmproxy
```

9) Start unpinner to remove SSL-pinning
```
$ sudo python scripts/unpinner.py
```

To avoid root you can use: https://github.com/sensepost/objection<br/>
Frida examples can be found here: https://www.frida.re/docs/examples/android/
