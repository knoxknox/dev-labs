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

func TestRemoveByGivenKey(t *testing.T) {
  subject := NewMap()
  subject.Set("key", "value")
  subject.Remove("key")
  subject.Remove("non existing key")

  assert.Equal(t, "", subject.Get("key"))
  assert.Equal(t, "", subject.Get("non existing key"))
}

func TestMapValues(t *testing.T) {
  subject := NewMap()
  subject.Set("x", "10")
  subject.Set("y", "20")

  assert.Equal(t, []string{"x:10", "y:20"}, subject.Values())
}
