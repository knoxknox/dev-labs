package cmd

import (
  "github.com/knoxknox/dev-labs/goimc/app/resp"
  "github.com/knoxknox/dev-labs/goimc/app/storage"
  "github.com/knoxknox/dev-labs/goimc/app/server/reply"
)

/**
 * PING [message]
 * https://redis.io/commands/ping
 */
func ping(writer *reply.Reply, command *resp.Command, store *storage.Storage) {
  message := command.Key
  if len(message) == 0 {
    writer.SendString("PONG")
  } else {
    writer.SendString(message)
  }
}
