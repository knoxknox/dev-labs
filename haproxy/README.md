# haproxy

## Docs

https://cbonte.github.io/haproxy-dconv/2.5/configuration.html#4.1

## Usage

Run demo with `docker-compose up`.
```
> haproxy_1    | Loading success
> server9001_1 | Server is listening on 0.0.0.0:9001
> server9002_1 | Server is listening on 0.0.0.0:9002
> server9003_1 | Server is listening on 0.0.0.0:9003
> server9004_1 | Server is listening on 0.0.0.0:9004
```

Check that each server respond properly:
```
$ curl 0.0.0.0:9001 # status_code = 200, body = 9001
$ curl 0.0.0.0:9002 # status_code = 200, body = 9002
$ curl 0.0.0.0:9003 # status_code = 200, body = 9003
$ curl 0.0.0.0:9004 # status_code = 200, body = 9004
```

Check that haproxy proxies requests properly:
```
$ curl 0.0.0.0:3000 # status_code = 200, body = 9001
$ curl 0.0.0.0:3000 # status_code = 200, body = 9002
$ curl 0.0.0.0:3000 # status_code = 200, body = 9003
$ curl 0.0.0.0:3000 # status_code = 200, body = 9004

$ curl 0.0.0.0:3000/app1 # status_code = 200, body = 9001
$ curl 0.0.0.0:3000/app1 # status_code = 200, body = 9002

$ curl 0.0.0.0:3000/app2 # status_code = 200, body = 9003
$ curl 0.0.0.0:3000/app2 # status_code = 200, body = 9004
```
