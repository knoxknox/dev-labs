package structs

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestMap(t *testing.T) {
  subject := NewMap()
  subject.Set("key", "value")

  assert.Equal(t, "value", subject.Get("key"))
}

func TestKeyChange(t *testing.T) {
  subject := NewMap()
  subject.Set("key", "value")
  subject.Set("key", "test value")

  assert.Equal(t, "test value", subject.Get("key"))
}

func TestNonExistingKey(t *testing.T) {
  subject := NewMap()
  subject.Set("key", "value")

  assert.Equal(t, "", subject.Get("non existing key"))
}
