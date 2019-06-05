package reply

import (
  "net"
  "app/resp"
)

type Reply struct {
  writer *resp.RespEncoder
}

func NewReply(conn net.Conn) *Reply {
  return &Reply{
    writer: resp.NewEncoder(conn),
  }
}

func (reply *Reply) SendNull() {
  reply.writer.EncodeNull("-1")
}

func (reply *Reply) SendError(err error) {
  reply.writer.EncodeError(err.Error())
}

func (reply *Reply) SendArray(msg ...string) {
  reply.writer.Encode(msg...)
}

func (reply *Reply) SendInteger(msg int) {
  reply.writer.EncodeInteger(msg)
}

func (reply *Reply) SendString(msg string) {
  reply.writer.EncodeString(msg)
}

func (reply *Reply) SendBulkString(msg string) {
  reply.writer.EncodeBulkString(msg)
}
