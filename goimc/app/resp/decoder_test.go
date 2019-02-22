package resp

import (
  "bytes"
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestDecodeCommand(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*2\r\n$4\r\nLLEN\r\n$4\r\nlist\r\n")

  command, _ := subject.Parse()
  assert.Equal(t, command.name, "LLEN")
  assert.Equal(t, command.key, "list")
  assert.Equal(t, len(command.args), 0)
}

func TestDecodeCommandArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*3\r\n$3\r\nGET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n")

  command, _ := subject.Parse()
  assert.Equal(t, command.name, "GET")
  assert.Equal(t, command.key, "key")
  assert.Equal(t, len(command.args), 1)
  assert.Equal(t, command.args[0], "value")
}

func TestDecodeCommandMultipleArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*4\r\n$4\r\nHSET\r\n$4\r\nhash\r\n$5\r\nfield\r\n$5\r\nvalue\r\n")

  command, _ := subject.Parse()
  assert.Equal(t, command.name, "HSET")
  assert.Equal(t, command.key, "hash")
  assert.Equal(t, len(command.args), 2)
  assert.Equal(t, command.args[0], "field")
  assert.Equal(t, command.args[1], "value")
}

func TestIncorrectPackageBody(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*1\r\n$4\r\nLLEN\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}

func TestPrefixTooShort(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("1\r\n$4\r\nLLEN\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package", err.Error())
  }
}

func TestPrefixIncorrectLineEnding(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*2\t\n$4\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package", err.Error())
  }
}

func TestPrefixIncorrectPackageSize(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*X\r\n$4\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package size", err.Error())
  }
}

func TestCommandTooShort(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*2\r\n4\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}

func TestCommandIncorrectLineEnding(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*2\r\n$4\r\nLLEN\t\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}

func TestCommandIncorrectPackageSize(t *testing.T) {
  var buf bytes.Buffer
  subject := Decoder(&buf)
  buf.WriteString("*2\r\n$9\r\nLLEN\r\n$4\r\nlist\r\n")

  _, err := subject.Parse()
  if assert.Error(t, err) {
    assert.Equal(t, "Invalid package body", err.Error())
  }
}
