package structs

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestList(t *testing.T) {
  subject := NewList()
  subject.Set("element")

  assert.Equal(t, []string{"element"}, subject.Get())
}

func TestEmptyList(t *testing.T) {
  subject := NewList()

  assert.Equal(t, 0, len(subject.Get()))
  assert.Equal(t, []string{}, subject.Get())
}

func TestMultipleValues(t *testing.T) {
  subject := NewList()
  subject.Set("element 1")
  subject.Set("element 2")

  assert.Equal(t, []string{"element 1", "element 2"}, subject.Get())
}
