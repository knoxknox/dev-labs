package log

import (
  "fmt"
  "log"
)

var Level = DEBUG

func Init(level int) {
  Level = level
}

func Info(msg string, args ...interface{}) {
  if (Level <= INFO) {
    log.Printf(fmt.Sprintf("[INFO]: %s", msg), args...)
  }
}

func Error(msg string, args ...interface{}) {
  if (Level <= ERROR) {
    log.Printf(fmt.Sprintf("[ERROR]: %s", msg), args...)
  }
}
