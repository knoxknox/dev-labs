package main

import (
  "fmt"
  "app/version"
)

func main() {
  fmt.Printf("Version=%d.%d", version.Major, version.Minor)
}
