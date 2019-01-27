proxy:
	mitmproxy

inject:
	sudo python scripts/unpinner.py

install:
	adb install -r ~/Documents/build/10.20-c24aa5f0.apk

listener:
	adb push frida-server /data/local/tmp/
	adb shell "chmod 755 /data/local/tmp/frida-server"
	echo 'Listen...' && adb shell "/data/local/tmp/frida-server &"

emulator:
	ANDROID_SDK_ROOT=~/Library/Android/sdk emulator -avd an60 -http-proxy localhost:8080
