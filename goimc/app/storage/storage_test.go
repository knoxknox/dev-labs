package storage

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestInt(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", 4200)

  assert.Equal(t, 4200, subject.Get("key"))
}

func TestString(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", "value")

  assert.Equal(t, "value", subject.Get("key"))
}

func TestArrayList(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", []string{"value"})

  assert.Equal(t, []string{"value"}, subject.Get("key"))
}

func TestDictionary(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", map[string]string{"field": "value"})

  assert.Equal(t, map[string]string{"field": "value"}, subject.Get("key"))
}
