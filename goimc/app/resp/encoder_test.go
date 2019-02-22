package resp

import (
  "bytes"
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestEncodeError(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.EncodeError("Error message")

  assert.Equal(t, buf.String(), "-Error message\r\n")
}

func TestEncodeString(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.EncodeString("OK")

  assert.Equal(t, buf.String(), "+OK\r\n")
}

func TestEncodeInteger(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.EncodeInteger(42)

  assert.Equal(t, buf.String(), ":42\r\n")
}

func TestEncodeEmptyBulkString(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.EncodeBulkString("")

  assert.Equal(t, buf.String(), "$0\r\n\r\n")
}

func TestEncodeNonEmptyBulkString(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.EncodeBulkString("Test string")

  assert.Equal(t, buf.String(), "$11\r\nTest string\r\n")
}

func TestEncodeCommand(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.Encode("LLEN", "list")

  assert.Equal(t, buf.String(), "*2\r\n$4\r\nLLEN\r\n$4\r\nlist\r\n")
}

func TestEncodeCommandArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.Encode("GET", "key", "value")

  assert.Equal(t, buf.String(), "*3\r\n$3\r\nGET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n")
}

func TestEncodeCommandMultipleArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := Encoder(&buf)
  subject.Encode("HSET", "hash", "field", "value")

  assert.Equal(t, buf.String(), "*4\r\n$4\r\nHSET\r\n$4\r\nhash\r\n$5\r\nfield\r\n$5\r\nvalue\r\n")
}
