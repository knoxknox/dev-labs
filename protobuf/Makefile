install:
	mkdir /tmp/protoc
	wget -P /tmp/protoc https://github.com/google/protobuf/releases/download/v3.6.0/protoc-3.6.0-linux-x86_64.zip
	wget -P /tmp/protoc https://repo1.maven.org/maven2/com/google/protobuf/protoc/2.6.1/protoc-2.6.1-linux-x86_64.exe

	unzip -d /tmp/protoc /tmp/protoc/protoc-3.6.0-linux-x86_64.zip
	chmod +x /tmp/protoc/bin/protoc /tmp/protoc/protoc-2.6.1-linux-x86_64.exe

	cp /tmp/protoc/bin/protoc $(HOME)/workspace/bin/protoc3
	cp /tmp/protoc/protoc-2.6.1-linux-x86_64.exe $(HOME)/workspace/bin/protoc2
	echo "install protoc2/protoc3 to bin directory: done!" && rm -rf /tmp/protoc

compile:
	mkdir target
	./bin/protoc2 --java_out target code/settings.proto
	wget -P target http://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/2.6.1/protobuf-java-2.6.1.jar
	javac -classpath target/protobuf-java-2.6.1.jar target/com/chrome/Settings.java -d target && rm target/com/chrome/Settings.java
