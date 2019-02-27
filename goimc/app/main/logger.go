package main

import (
  "fmt"
  "log"
)

func LogInfo(msg string, args ...interface{}) {
  log.Printf(fmt.Sprintf("[INFO]: %s", msg), args...)
}

func LogError(msg string, args ...interface{}) {
  log.Printf(fmt.Sprintf("[ERROR]: %s", msg), args...)
}
