package main

import (
  "github.com/ahmetb/go-linq"
  xs "github.com/huandu/xstrings"
  gofunk "github.com/thoas/go-funk"
)

func Count(input string) int {
  return xs.Count(input, "aeo")
}

func Contains(input string) bool {
  return gofunk.Contains(input, "ing")
}

func DoubledEven(list []int) interface{} {
  return linq.
    From(list).
    Where(func(x interface{}) bool { return x.(int) % 2 == 0 }).
    SelectT(func(x interface{}) int { return x.(int) * 2 }).Results()
}
