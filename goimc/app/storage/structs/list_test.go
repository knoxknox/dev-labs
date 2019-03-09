package structs

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestList(t *testing.T) {
  subject := NewList()
  subject.Set("element")

  assert.Equal(t, subject.Get(), []string{"element"})
}

func TestEmptyList(t *testing.T) {
  subject := NewList()

  assert.Equal(t, len(subject.Get()), 0)
  assert.Equal(t, subject.Get(), []string{})
}

func TestMultipleValues(t *testing.T) {
  subject := NewList()
  subject.Set("element 1")
  subject.Set("element 2")

  assert.Equal(t, subject.Get(), []string{"element 1", "element 2"})
}
