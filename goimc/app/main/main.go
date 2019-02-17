package main

import (
  "app/data"
  "fmt"
)

func main() {
  list := data.Seed()

  fmt.Println(data.Version())
  fmt.Println(DoubledEven(list))

  fmt.Println(Count("Test string"))
  fmt.Println(Contains("Test string"))
}
