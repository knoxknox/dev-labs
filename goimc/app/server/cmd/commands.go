package cmd

import (
  "app/resp"
  "app/storage"
  "app/server/reply"
)

var Commands = map[string]func(*reply.Reply, *resp.Command, *storage.Storage) {
  "GET": get,       // https://redis.io/commands/get
  "SET": set,       // https://redis.io/commands/set

  "PING": ping,     // https://redis.io/commands/ping

  "HDEL": hdel,     // https://redis.io/commands/hdel
  "HGET": hget,     // https://redis.io/commands/hget
  "HSET": hset,     // https://redis.io/commands/hset

  "LLEN": llen,     // https://redis.io/commands/llen
  "LPOP": lpop,     // https://redis.io/commands/lpop
  "RPOP": rpop,     // https://redis.io/commands/rpop
  "LREM": lrem,     // https://redis.io/commands/lrem
  "LSET": lset,     // https://redis.io/commands/lset
  "LPUSH": lpush,   // https://redis.io/commands/lpush
  "RPUSH": rpush,   // https://redis.io/commands/rpush
  "LRANGE": lrange, // https://redis.io/commands/lrange
}
