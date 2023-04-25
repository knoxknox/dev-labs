# docker

Build:
```
$ dc build
```

Start:
```
$ dc start
```

Execute commands:
```
$ dc ls
> docker-app-1    0.0.0.0:4567->4567/tcp
> docker-redis-1  0.0.0.0:6389->6379/tcp

$ dc docker-app-1 rake test
$ dc docker-redis-1 redis-cli info server
```

Network availability:
```
$ curl 0.0.0.0:6379
$ curl 0.0.0.0:4567/help

$ ifconfig en0 | grep inet
$ dc docker-app-1 wget --spider -q -S 192.168.0.50:4567
$ dc docker-redis-1 wget --spider -q -S 192.168.0.50:4567
```

Connect from container to the host:
- use special DNS name `host.docker.internal` to connect to host
