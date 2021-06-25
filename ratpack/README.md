# ratpack

## Setup

Run `make install` to install dependencies.

## Development

Start development server with `make server`.
```
$ curl 0.0.0.0:3000/health -v
$ curl 0.0.0.0:3000/protected -H 'Auth-Token: NONE' -v
$ curl 0.0.0.0:3000/protected -H 'Auth-Token: SECRET' -v
```

## Documentation

API documentation is available at https://ratpack.io.
