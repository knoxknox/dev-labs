package data

import (
  "github.com/stretchr/testify/assert"
  "testing"
)

func TestVersion(t *testing.T) {
  version := Version()
  assert.Equal(t, version, "Version=1.0")
}
