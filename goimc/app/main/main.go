package main

import (
  "app/log"
  "app/server"
)

func main() {
  log.Init(log.INFO)
  server.NewServer(":6379")
}
