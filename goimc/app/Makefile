init:
	go get github.com/kyoh86/richgo
	go get github.com/cespare/reflex
	go get github.com/stretchr/testify
	go get github.com/golang/dep/cmd/dep
	go get github.com/go-delve/delve/cmd/dlv

deps:
	dep ensure

run:
	@go run app/main

debug:
	@dlv debug app/main

test:
	@richgo test -v app/...

watch:
	@reflex -s -d none -g '**/*.go' -- go run app/main

build:
	cd main && GOOS=linux GOARCH=amd64 go build -o /tmp/app

coverage:
	@richgo test -v app/... -coverprofile=/tmp/coverage.out
	@go tool cover -o /tmp/coverage.html -html=/tmp/coverage.out
