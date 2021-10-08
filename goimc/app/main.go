package main

import (
  "github.com/knoxknox/dev-labs/goimc/app/log"
  "github.com/knoxknox/dev-labs/goimc/app/server"
)

func main() {
  log.Init(log.INFO)
  server.NewServer(":6379")
}
