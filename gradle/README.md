# gradle

Install:
```
$ sudo add-apt-repository -y ppa:openjdk-r/ppa
$ sudo apt-get update && sudo apt-get -y install openjdk-8-jdk
$
$ sudo update-alternatives --config java
```
```
$ sudo mkdir /opt/gradle
$ export PATH=$PATH:/opt/gradle/gradle-4.9/bin
$ wget https://services.gradle.org/distributions/gradle-4.9-bin.zip
$ sudo unzip -d /opt/gradle gradle-4.9-bin.zip && rm gradle-4.9-bin.zip
```
