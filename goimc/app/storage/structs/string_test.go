package structs

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestString(t *testing.T) {
  subject := NewString()
  subject.Set("test string")

  assert.Equal(t, subject.Get(), "test string")
}

func TestJsonString(t *testing.T) {
  subject := NewString()
  subject.Set("{\r\n\"key\":\"value\"\r\n}")

  assert.Equal(t, subject.Get(), "{\r\n\"key\":\"value\"\r\n}")
}
