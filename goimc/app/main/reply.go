package main

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

func (reply *Reply) Send(msg string) {
  reply.writer.EncodeBulkString(msg)
}

func (reply *Reply) SendStr(msg string) {
  reply.writer.EncodeString(msg)
}

func (reply *Reply) SendError(err error) {
  reply.writer.EncodeError(err.Error())
}
