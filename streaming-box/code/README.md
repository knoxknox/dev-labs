# ratpack

## Docs
https://ratpack.io

## Install
```
$ bundle install
$ bundle exec jbundle install
$
$ jruby --server -S scripts/server
```

## Requests
```
$ curl 0.0.0.0:3000/health
$ curl 0.0.0.0:3000/protected -H 'Auth-Token: NONE'
$ curl 0.0.0.0:3000/protected -H 'Auth-Token: SECRET'
```
