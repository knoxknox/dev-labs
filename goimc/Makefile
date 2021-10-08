fmt:
	@go fmt ./...

run:
	@go run app/main.go

test:
	@richgo test -v ./...

debug:
	@dlv debug app/main.go

setup:
	go get github.com/kyoh86/richgo
	go get github.com/go-delve/delve/cmd/dlv

coverage:
	@richgo test -v ./... -coverprofile=/tmp/coverage.out
	@go tool cover -o /tmp/coverage.html -html=/tmp/coverage.out

build-linux:
	cd app && GOOS=linux GOARCH=amd64 go build -o /tmp/app-linux-amd64

build-darwin:
	cd app && GOOS=darwin GOARCH=amd64 go build -o /tmp/app-darwin-amd64
