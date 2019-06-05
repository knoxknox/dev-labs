package cmd

import (
  "app/resp"
  "app/storage"
  "app/server/reply"
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
