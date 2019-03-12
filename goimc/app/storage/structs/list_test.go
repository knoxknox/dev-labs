package structs

import (
  "testing"
  "github.com/stretchr/testify/assert"
)

func TestList(t *testing.T) {
  subject := NewList()
  subject.Add("element")

  assert.Equal(t, []string{"element"}, subject.Get())
}

func TestEmptyList(t *testing.T) {
  subject := NewList()

  assert.Equal(t, 0, subject.Size())
  assert.Equal(t, []string{}, subject.Get())
}

func TestMultipleValues(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.Add("element 2")

  assert.Equal(t, []string{"element 1", "element 2"}, subject.Get())
}

func TestSize(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.Add("element 2")
  subject.Add("element 3")

  assert.Equal(t, 3, subject.Size())
}

func TestPopLast(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.Add("element 2")
  subject.Add("element 3")

  assert.Equal(t, "element 3", subject.PopLast())
  assert.Equal(t, []string{"element 1", "element 2"}, subject.Get())
}

func TestPopFirst(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.Add("element 2")
  subject.Add("element 3")

  assert.Equal(t, "element 1", subject.PopFirst())
  assert.Equal(t, []string{"element 2", "element 3"}, subject.Get())
}

func TestPushLast(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.PushLast("element 2")

  assert.Equal(t, []string{"element 1", "element 2"}, subject.Get())
}

func TestPushFirst(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.PushFirst("element 0")

  assert.Equal(t, []string{"element 0", "element 1"}, subject.Get())
}

func TestSet(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.Add("element 2")
  subject.Set(0, "element 3")
  subject.Set(1, "element 4")

  assert.Equal(t, []string{"element 3", "element 4"}, subject.Get())
}

func TestRemove(t *testing.T) {
  subject := NewList()
  subject.Add("element 1")
  subject.Add("element 2")
  subject.Add("element 3")
  subject.Add("element 4")
  subject.Remove(0)
  subject.Remove(1)

  assert.Equal(t, []string{"element 2", "element 4"}, subject.Get())
}
