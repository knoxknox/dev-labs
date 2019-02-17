package data

import (
  "app/version"
  "fmt"
)

func Seed() []int {
  return []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
}

func Version() string {
  return fmt.Sprintf("Version=%d.%d", version.Major, version.Minor)
}
