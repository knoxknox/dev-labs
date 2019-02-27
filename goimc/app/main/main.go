package main

import (
  "fmt"
  "app/version"
)

func main() {
  NewServer(":6379")
  fmt.Printf("Version=%d.%d", version.Major, version.Minor)
}
