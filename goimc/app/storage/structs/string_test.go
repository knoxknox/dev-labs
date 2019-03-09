package structs

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestString(t *testing.T) {
  subject := NewString()
  subject.Set("test string")

  assert.Equal(t, "test string", subject.Get())
}

func TestJsonString(t *testing.T) {
  subject := NewString()
  subject.Set("{\r\n\"key\":\"value\"\r\n}")

  assert.Equal(t, "{\r\n\"key\":\"value\"\r\n}", subject.Get())
}
