# app

## Setup

Install asdf and golang plugin:
- follow instructions here https://github.com/asdf-vm/asdf
- run `asdf plugin-add golang https://github.com/kennyp/asdf-golang.git`

Install golang latest version via asdf:
- install golang via `asdf install golang 1.21.3`
- set global golang version `asdf global golang 1.21.3`

Install development packages and reshim:
- run `make install && asdf reshim golang` to complete setup

## Development

Available commands:
- `make fmt` to format code
- `make run` to start project
- `make test` to run test suite
- `make debug` to start debugger
- `make update` to update dependencies
- `make build-linux` to build linux binary
- `make build-darwin` to build darwin binary

Debug app/tests instructions:
- open required file to debug;
- add `import "runtime"` to list of imports;
- add `runtime.Breakpoint()` to the source code;
- run `make debug` and type `continue` to start server;
