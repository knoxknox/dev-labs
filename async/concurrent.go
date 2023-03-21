package main

import (
  "fmt"
  "sync"
  "time"
  "net/http"
  "math/rand"
  "sync/atomic"
)

// Once example

func onceEx() {
  var once sync.Once

  for i := 0; i < 10; i++ {
    once.Do(func() {
      fmt.Println("Run once on initialization")
    })
  }
}

// Mutex example

type Storage struct {
  MapMutex *sync.Mutex
  Map      map[string]string
}

func (storage *Storage) add(key string, value string) {
  storage.MapMutex.Lock()
  defer storage.MapMutex.Unlock()

  storage.Map[key] = value
}

func mutexEx() {
  object := &Storage{
    Map: map[string]string{},
    MapMutex: new(sync.Mutex),
  }

  object.add("key1", "value1")
  object.add("key2", "value2")
  object.add("key3", "value3")
  fmt.Println("%v\n", object.Map)
}

// Channel example

type Producer struct {
  Queue chan int
}

func (p *Producer) produce() {
  for {
    p.Queue <- rand.Int()
    time.Sleep(1 * time.Second)
  }
}

func channelsEx() {
  channel := make(chan int, 10)
  producer := &Producer{Queue: channel}

  go producer.produce()
  // read from multiple channels
  ticker := time.NewTicker(2 * time.Second)
  for {
    select {
    case i:= <-producer.Queue:
      fmt.Println("Queue: %v\n", i)
    case tickerTime:= <-ticker.C:
      fmt.Println("Ticker: %v\n", tickerTime)
    }
  }
}

// WaitGroup example

func waitGroupEx() {
  var wg sync.WaitGroup
  var urls = []string {
    "http://www.golang.org",
    "http://www.google.com",
  }

  var visited int32
  for _, url := range urls {
    wg.Add(1) // increment WG counter on start
    go func(url string) {
      defer wg.Done() // decrement WG counter on complete

      http.Get(url)
      fmt.Println(url)
      atomic.AddInt32(&visited, 1)
    }(url)
  }
  wg.Wait() // wait when all HTTP requests from list will be ready
}

// ConditionVariable example

func conditionVariableEx() {
  state := "idle"

  mutex := sync.Mutex{}
  condition := sync.NewCond(&mutex)

  go func() {
    condition.L.Lock()
    defer condition.L.Unlock()

    for state == "idle" {
      condition.Wait() // waiting to unblock
    }

    fmt.Println("Unblocked after state changed")
  }()

  go func() {
    condition.L.Lock()
    defer condition.L.Unlock()
    time.Sleep(5 * time.Second)

    state = "running"
    condition.Signal() // notify single waiting goroutine
    condition.Broadcast() // notify all waiting goroutines
  }()
}

func main() {
  onceEx()
  mutexEx()
  channelsEx()
  waitGroupEx()
  conditionVariableEx()
}
