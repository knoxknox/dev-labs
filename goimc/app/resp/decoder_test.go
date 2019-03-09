package resp

import (
  "bytes"
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestDecodeCommand(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*2\r\n$4\r\nLLEN\r\n$4\r\nlist\r\n")

  command, _ := subject.Parse()
  assert.Equal(t, "LLEN", command.Name)
  assert.Equal(t, "list", command.Key)
  assert.Equal(t, 0, len(command.Args))
}

func TestDecodeCommandArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*3\r\n$3\r\nSET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n")

  command, _ := subject.Parse()
  assert.Equal(t, "SET", command.Name)
  assert.Equal(t, "key", command.Key)
  assert.Equal(t, 1, len(command.Args))
  assert.Equal(t, "value", command.Args[0])
}

func TestDecodeCommandMultipleArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*4\r\n$4\r\nHSET\r\n$4\r\nhash\r\n$5\r\nfield\r\n$5\r\nvalue\r\n")

  command, _ := subject.Parse()
  assert.Equal(t, "HSET", command.Name)
  assert.Equal(t, "hash", command.Key)
  assert.Equal(t, 2, len(command.Args))
  assert.Equal(t, "field", command.Args[0])
  assert.Equal(t, "value", command.Args[1])
}

func TestIncorrectPackageBody(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*1\r\n$4\r\nLLEN\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}

func TestPrefixTooShort(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("1\r\n$4\r\nLLEN\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package", err.Error())
  }
}

func TestPrefixIncorrectLineEnding(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*2\t\n$4\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package", err.Error())
  }
}

func TestPrefixIncorrectPackageSize(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*X\r\n$4\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package size", err.Error())
  }
}

func TestCommandTooShort(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*2\r\n4\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}

func TestCommandIncorrectLineEnding(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*2\r\n$4\r\nLLEN\t\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}

func TestCommandIncorrectPackageSize(t *testing.T) {
  var buf bytes.Buffer
  subject := NewDecoder(&buf)
  buf.WriteString("*2\r\n$9\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}
