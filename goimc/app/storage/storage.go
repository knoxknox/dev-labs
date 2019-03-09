package storage

import (
  "sync"
)

type Storage struct {
  mutex *sync.RWMutex
  container map[string]Object
}

func NewStorage() *Storage {
  return &Storage{
    mutex: &sync.RWMutex{},
    container: make(map[string]Object),
  }
}

func (storage *Storage) Get(key string) Object {
  storage.mutex.RLock()
  defer storage.mutex.RUnlock()

  return storage.container[key]
}

func (storage *Storage) Set(key string, value Object) {
  storage.mutex.Lock()
  defer storage.mutex.Unlock()

  storage.container[key] = value
}
