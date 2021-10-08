package cmd

import (
  "fmt"
  "github.com/knoxknox/dev-labs/goimc/app/resp"
  "github.com/knoxknox/dev-labs/goimc/app/storage"
  "github.com/knoxknox/dev-labs/goimc/app/server/reply"
  "github.com/knoxknox/dev-labs/goimc/app/storage/structs"
)

/**
 * GET key
 * https://redis.io/commands/get
 */
func get(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 {
    writer.SendError(fmt.Errorf("GET expects 1 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendNull()
    return
  }
  writer.SendBulkString(value.(*structs.String).Get())
}

/**
 * SET key value
 * https://redis.io/commands/set
 */
func set(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 1 {
    writer.SendError(fmt.Errorf("SET expects 2 argument(s)"))
    return
  }
  value := structs.NewString()
  value.Set(command.Args[0])
  store.Set(command.Key, value)
  writer.SendString("OK")
}
