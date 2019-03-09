package storage

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestInt(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", 4200)

  assert.Equal(t, subject.Get("key"), 4200)
}

func TestString(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", "value")

  assert.Equal(t, subject.Get("key"), "value")
}

func TestArrayList(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", []string{"value"})

  assert.Equal(t, subject.Get("key"), []string{"value"})
}

func TestDictionary(t *testing.T) {
  subject := NewStorage()
  subject.Set("key", map[string]string{"field": "value"})

  assert.Equal(t, subject.Get("key"), map[string]string{"field": "value"})
}
