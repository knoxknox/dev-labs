# docker

Example of dockerized application.
1. Login to the https://labs.play-with-docker.com
2. Copy files from this repo to the created container
3. Run command `./docker-aliases.sh` to setup dc aliases

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

Connect from container to the host:
```
Use a special DNS name 'host.docker.internal'.
```
