# docker

Build:
```
$ dc build
```

Start:
```
$ dc start
```

Requests:
```
$ curl http://0.0.0.0:5432
$ curl http://0.0.0.0:6379
$ curl https://0.0.0.0:443/help -k
```

Execute commands:
```
$ dc ls
> docker-app-1       -
> docker-nginx-1     0.0.0.0:443->443/tcp
> docker-redis-1     0.0.0.0:6379->6379/tcp
> docker-postgres-1  0.0.0.0:5432->5432/tcp

$ dc docker-app-1 rake test
$ dc docker-nginx-1 nginx -v
$ dc docker-redis-1 redis-cli info server
$ dc docker-postgres-1 psql -U postgres --list
```

Network availability:
- use special DNS name `host.docker.internal` to connect to the host;
- use services names (ex: `app`, `nginx`, `redis`) inside the docker network;
