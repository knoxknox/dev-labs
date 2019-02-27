package main

import (
  "sync"
)

type storage struct {
  mutex *sync.RWMutex
  container map[string]string
}

func NewStorage() *storage {
  return &storage{
    mutex: &sync.RWMutex{},
    container: make(map[string]string),
  }
}

func (storage *storage) Get(key string) string {
  storage.mutex.RLock()
  defer storage.mutex.RUnlock()

  return storage.container[key]
}

func (storage *storage) Set(key string, value string) {
  storage.mutex.Lock()
  defer storage.mutex.Unlock()

  storage.container[key] = value
}
