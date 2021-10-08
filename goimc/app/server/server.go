package server

import (
  "io"
  "os"
  "fmt"
  "net"
  "github.com/knoxknox/dev-labs/goimc/app/log"
  "github.com/knoxknox/dev-labs/goimc/app/resp"
  "github.com/knoxknox/dev-labs/goimc/app/storage"
  "github.com/knoxknox/dev-labs/goimc/app/server/cmd"
  "github.com/knoxknox/dev-labs/goimc/app/server/reply"
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

  writer := reply.NewReply(client.conn)
  reader := resp.NewDecoder(client.conn)

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

func (client *client) handleCommand(writer *reply.Reply, command *resp.Command) {
  handler := cmd.Commands[command.Name]
  if handler != nil {
    handler(writer, command, client.store)
    return
  }
  writer.SendError(fmt.Errorf("Unknown command: %s", command.Name))
}
