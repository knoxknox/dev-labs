package cmd

import (
  "fmt"
  "github.com/knoxknox/dev-labs/goimc/app/resp"
  "github.com/knoxknox/dev-labs/goimc/app/storage"
  "github.com/knoxknox/dev-labs/goimc/app/server/reply"
  "github.com/knoxknox/dev-labs/goimc/app/storage/structs"
)

/**
 * HDEL key field
 * https://redis.io/commands/hdel
 */
func hdel(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 1 {
    writer.SendError(fmt.Errorf("HDEL expects 2 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendInteger(0)
    return
  }
  value.(*structs.Map).Remove(command.Args[0])
  writer.SendInteger(1)
}

/**
 * HGET key field
 * https://redis.io/commands/hget
 */
func hget(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 1 {
    writer.SendError(fmt.Errorf("HGET expects 2 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendNull()
    return
  }
  writer.SendBulkString(value.(*structs.Map).Get(command.Args[0]))
}

/**
 * HSET key field value
 * https://redis.io/commands/hset
 */
func hset(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 2 {
    writer.SendError(fmt.Errorf("HSET expects 3 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    object := structs.NewMap()
    object.Set(command.Args[0], command.Args[1])
    store.Set(command.Key, object)
    writer.SendInteger(1)
  } else {
    value.(*structs.Map).Set(command.Args[0], command.Args[1])
    writer.SendInteger(0)
  }
}
