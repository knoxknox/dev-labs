package main

import (
  "os"
  "net"
  "app/resp"
)

type client struct {
  id int64
  conn net.Conn
  store *storage
}

func NewServer(address string) {
  listener, err := net.Listen("tcp", address)
  if err != nil {
    LogError("Could not start server: %s", err)
    os.Exit(1)
  }
  LogInfo("Server started on port: %s", address)

  var id int64
  store := NewStorage()
  for {
    conn, err := listener.Accept()
    if err != nil {
      LogError("Error to handle request: %s", err)
      continue
    }

    id++
    client := &client{id: id, conn: conn, store: store}
    go client.serve() // handle request in separate goroutine
  }
}

func (client *client) serve() {
  defer client.conn.Close()
  decoder := resp.Decoder(client.conn)

  command, err := decoder.Parse()
  LogInfo("Parsed result: %s (%s)", command, err)
}
