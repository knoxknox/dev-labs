package resp

import (
  "io"
  "bufio"
  "strconv"
)

var (
  arrayCode = byte('*')
  errorCode = byte('-')
  stringCode = byte('+')
  integerCode = byte(':')
  bulkStringCode = byte('$')
  lineEndingCode = []byte{'\r', '\n'}
)

type RespEncoder struct {
  *bufio.Writer
}

func Encoder(writer io.Writer) *RespEncoder {
  return &RespEncoder{
    Writer: bufio.NewWriter(writer),
  }
}

func (e *RespEncoder) Encode(args ...string) (err error) {
  e.WriteByte(arrayCode)
  e.WriteString(strconv.Itoa(len(args)))
  e.Write(lineEndingCode)

  for _, arg := range args {
    e.WriteByte(bulkStringCode)
    e.WriteString(strconv.Itoa(len(arg)))
    e.Write(lineEndingCode)
    e.WriteString(arg)
    e.Write(lineEndingCode)
  }

  return e.Flush()
}

func (e *RespEncoder) EncodeInteger(arg int) (err error) {
  e.WriteByte(integerCode)
  e.WriteString(strconv.Itoa(arg))
  e.Write(lineEndingCode)

  return e.Flush()
}

func (e *RespEncoder) EncodeError(arg string) (err error) {
  e.WriteByte(errorCode)
  e.WriteString(arg)
  e.Write(lineEndingCode)

  return e.Flush()
}

func (e *RespEncoder) EncodeString(arg string) (err error) {
  e.WriteByte(stringCode)
  e.WriteString(arg)
  e.Write(lineEndingCode)

  return e.Flush()
}

func (e *RespEncoder) EncodeBulkString(arg string) (err error) {
  e.WriteByte(bulkStringCode)
  e.WriteString(strconv.Itoa(len(arg)))
  e.Write(lineEndingCode)
  e.WriteString(arg)
  e.Write(lineEndingCode)

  return e.Flush()
}
