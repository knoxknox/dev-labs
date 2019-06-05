package resp

import (
  "bytes"
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestEncodeNull(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.EncodeNull("-1")

  assert.Equal(t, "$-1\r\n", buf.String())
}

func TestEncodeError(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.EncodeError("Error message")

  assert.Equal(t, "-Error message\r\n", buf.String())
}

func TestEncodeString(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.EncodeString("OK")

  assert.Equal(t, "+OK\r\n", buf.String())
}

func TestEncodeInteger(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.EncodeInteger(42)

  assert.Equal(t, ":42\r\n", buf.String())
}

func TestEncodeEmptyBulkString(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.EncodeBulkString("")

  assert.Equal(t, "$0\r\n\r\n", buf.String())
}

func TestEncodeNonEmptyBulkString(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.EncodeBulkString("Test string")

  assert.Equal(t, "$11\r\nTest string\r\n", buf.String())
}

func TestEncodeCommand(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.Encode("LLEN", "list")

  assert.Equal(t, "*2\r\n$4\r\nLLEN\r\n$4\r\nlist\r\n", buf.String())
}

func TestEncodeCommandArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.Encode("SET", "key", "value")

  assert.Equal(t, "*3\r\n$3\r\nSET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n", buf.String())
}

func TestEncodeCommandMultipleArguments(t *testing.T) {
  var buf bytes.Buffer
  subject := NewEncoder(&buf)
  subject.Encode("HSET", "hash", "field", "value")

  assert.Equal(t, "*4\r\n$4\r\nHSET\r\n$4\r\nhash\r\n$5\r\nfield\r\n$5\r\nvalue\r\n", buf.String())
}
