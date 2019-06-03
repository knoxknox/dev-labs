package server

import (
  "io"
  "os"
  "fmt"
  "net"
  "app/log"
  "app/resp"
  "app/storage"
  "app/server/responder"
)

type client struct {
  id int64
  conn net.Conn
  store *storage.Storage
}

func NewServer(address string) {
  listener, err := net.Listen("tcp", address)
  if err != nil {
    log.Error("Could not start server: %s", err)
    os.Exit(1)
  }
  defer listener.Close()
  log.Info("Server started on port: %s", address)

  var id int64
  store := storage.NewStorage()
  for {
    conn, err := listener.Accept()
    if err != nil {
      log.Error("Error to handle request: %s", err)
      continue
    }

    id++
    client := &client{id: id, conn: conn, store: store}
    go client.serve() // handle client in separate goroutine
  }
}

func (client *client) close() {
  if err := client.conn.Close(); err == nil {
    log.Info("Close connection: %s", client.conn.RemoteAddr())
  }
}

func (client *client) serve() {
  defer client.close()
  log.Info("Connection %d: %s", client.id, client.conn.RemoteAddr())

  reader := resp.NewDecoder(client.conn)
  writer := responder.NewReply(client.conn)

  for {
    command, err := reader.Parse()
    if err != nil {
      if err != io.EOF {
        writer.SendError(err)
      }
      return // break, close connection
    }

    client.handleCommand(writer, command)
  }
}

func (client *client) handleCommand(writer *responder.Reply, command *resp.Command) {
  switch command.Name {
  case "GET":
    if len(command.Key) < 1 {
      writer.SendError(fmt.Errorf("GET expects 1 argument(s)"))
      return
    }
    value := client.store.Get(command.Key)
    if value == nil {
      writer.Send("nil")
      return
    }
    writer.Send(value.(string))
  case "SET":
    if len(command.Key) < 1 || len(command.Args) < 1 {
      writer.SendError(fmt.Errorf("SET expects 2 argument(s)"))
      return
    }
    client.store.Set(command.Key, command.Args[0])
    writer.SendStr("OK")
  default:
    writer.SendError(fmt.Errorf("Unknown command: %s", command.Name))
  }
}
