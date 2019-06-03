package cmd

import (
  "fmt"
  "app/resp"
  "app/storage"
  "app/server/reply"
)

func commandSet(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 1 {
    writer.SendError(fmt.Errorf("SET expects 2 argument(s)"))
    return
  }
  store.Set(command.Key, command.Args[0])
  writer.SendStr("OK")
}

func commandGet(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 {
    writer.SendError(fmt.Errorf("GET expects 1 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.Send("nil")
    return
  }
  writer.Send(value.(string))
}
