package structs

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestMap(t *testing.T) {
  subject := NewMap()
  subject.Set("key", "value")

  assert.Equal(t, subject.Get("key"), "value")
}

func TestKeyChange(t *testing.T) {
  subject := NewMap()
  subject.Set("key", "value")
  subject.Set("key", "test value")

  assert.Equal(t, subject.Get("key"), "test value")
}

func TestNonExistingKey(t *testing.T) {
  subject := NewMap()
  subject.Set("key", "value")

  assert.Equal(t, subject.Get("non existing key"), "")
}
