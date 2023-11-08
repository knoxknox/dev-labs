fmt:
	@go fmt ./...

run:
	@air -c .air.toml

test:
	@richgo test -v ./...

debug:
	@dlv debug app/main.go

update:
	go get -t -u ./... && go mod tidy

install:
	go get ./...
	go install github.com/cosmtrek/air@latest
	go install github.com/kyoh86/richgo@latest
	go install github.com/go-delve/delve/cmd/dlv@latest
