# docker

Example of dockerized application.<br/>
Online playground: https://labs.play-with-docker.com

How to run:
```
$ dc build
$ dc start
$ dc app rake test
$ curl 0.0.0.0:4567/help
$
$ ifconfig eth0 | grep inet
$ dc app curl 192.168.0.50:4567
$ dc redis-db curl 192.168.0.50:4567
```
