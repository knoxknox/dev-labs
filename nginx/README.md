# nginx

## Docs

http://nginx.org/en/docs/dirindex.html

## Usage

Run demo with `docker-compose up`.
```
> nginx_main_1 | Configuration complete
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

Check that nginx proxies requests properly:
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

Next configurations can be used in this project:
- conf/l4.conf.ex: example how to use L4 tcp proxy;
- conf/l7.conf.ex: example how to use L7 http proxy;
- conf/web.conf.ex: example how to use nginx as web server;

Change `conf/nginx.conf` then run `docker-compose restart nginx`.
