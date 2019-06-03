package cmd

import (
  "app/resp"
  "app/storage"
  "app/server/reply"
)

var Commands = map[string]func(*reply.Reply, *resp.Command, *storage.Storage) {
  "GET": commandGet, // https://redis.io/commands/get
  "SET": commandSet, // https://redis.io/commands/set
}
