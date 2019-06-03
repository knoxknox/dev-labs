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
    print("INFO", msg, args...)
  }
}

func Warn(msg string, args ...interface{}) {
  if (Level <= WARN) {
    print("WARN", msg, args...)
  }
}

func Debug(msg string, args ...interface{}) {
  if (Level <= DEBUG) {
    print("DEBUG", msg, args...)
  }
}

func Error(msg string, args ...interface{}) {
  if (Level <= ERROR) {
    print("ERROR", msg, args...)
  }
}

func Fatal(msg string, args ...interface{}) {
  if (Level <= FATAL) {
    print("FATAL", msg, args...)
  }
}

func print(level string, msg string, args ...interface{}) {
  log.Printf(fmt.Sprintf("[%s]: %s", level, msg), args...)
}
