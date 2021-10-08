package cmd

import (
  "fmt"
  "strconv"
  "github.com/knoxknox/dev-labs/goimc/app/resp"
  "github.com/knoxknox/dev-labs/goimc/app/storage"
  "github.com/knoxknox/dev-labs/goimc/app/server/reply"
  "github.com/knoxknox/dev-labs/goimc/app/storage/structs"
)

/**
 * LLEN key
 * https://redis.io/commands/llen
 */
func llen(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 {
    writer.SendError(fmt.Errorf("LLEN expects 1 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendInteger(0)
    return
  }
  writer.SendInteger(value.(*structs.List).Size())
}

/**
 * LPOP key
 * https://redis.io/commands/lpop
 */
func lpop(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 {
    writer.SendError(fmt.Errorf("LPOP expects 1 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendNull()
    return
  }
  writer.SendBulkString(value.(*structs.List).PopFirst())
}

/**
 * RPOP key
 * https://redis.io/commands/rpop
 */
func rpop(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 {
    writer.SendError(fmt.Errorf("RPOP expects 1 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendNull()
    return
  }
  writer.SendBulkString(value.(*structs.List).PopLast())
}

/**
 * LREM key index
 * https://redis.io/commands/lrem
 */
func lrem(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 1 {
    writer.SendError(fmt.Errorf("LREM expects 2 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendNull()
    return
  }
  index, error := strconv.Atoi(command.Args[0])
  if error == nil {
    value.(*structs.List).Remove(index)
    writer.SendInteger(value.(*structs.List).Size())
  } else {
    writer.SendError(fmt.Errorf("Index is not integer"))
  }
}

/**
 * LSET key index value
 * https://redis.io/commands/lset
 */
func lset(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 2 {
    writer.SendError(fmt.Errorf("LSET expects 3 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendNull()
    return
  }
  index, error := strconv.Atoi(command.Args[0])
  if error == nil {
    value.(*structs.List).Set(index, command.Args[1])
    writer.SendString("OK")
  } else {
    writer.SendError(fmt.Errorf("Index is not integer"))
  }
}

/**
 * LPUSH key value
 * https://redis.io/commands/lpush
 */
func lpush(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 1 {
    writer.SendError(fmt.Errorf("LPUSH expects 2 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    object := structs.NewList()
    object.PushFirst(command.Args[0])
    store.Set(command.Key, object)
  } else {
    value.(*structs.List).PushFirst(command.Args[0])
  }
  writer.SendInteger(store.Get(command.Key).(*structs.List).Size())
}

/**
 * RPUSH key value
 * https://redis.io/commands/rpush
 */
func rpush(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 || len(command.Args) < 1 {
    writer.SendError(fmt.Errorf("RPUSH expects 2 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    object := structs.NewList()
    object.PushLast(command.Args[0])
    store.Set(command.Key, object)
  } else {
    value.(*structs.List).PushLast(command.Args[0])
  }
  writer.SendInteger(store.Get(command.Key).(*structs.List).Size())
}

/**
 * LRANGE key
 * https://redis.io/commands/lrange
 */
func lrange(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  if len(command.Key) < 1 {
    writer.SendError(fmt.Errorf("LRANGE expects 1 argument(s)"))
    return
  }
  value := store.Get(command.Key)
  if value == nil {
    writer.SendNull()
    return
  }
  elements := value.(*structs.List).Get()
  writer.SendArray(elements...)
}
