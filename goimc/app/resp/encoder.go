package resp

import (
  "io"
  "bufio"
  "strconv"
)

var (
  arrayCode = []byte{'*'}
  errorCode = []byte{'-'}
  stringCode = []byte{'+'}
  integerCode = []byte{':'}
  bulkStringCode = []byte{'$'}
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
  e.Write(arrayCode)
  e.WriteString(strconv.Itoa(len(args)))
  e.Write(lineEndingCode)

  for _, arg := range args {
    e.Write(bulkStringCode)
    e.WriteString(strconv.Itoa(len(arg)))
    e.Write(lineEndingCode)
    e.WriteString(arg)
    e.Write(lineEndingCode)
  }

  return e.Flush()
}

func (e *RespEncoder) EncodeInteger(arg int) (err error) {
  e.Write(integerCode)
  e.WriteString(strconv.Itoa(arg))
  e.Write(lineEndingCode)

  return e.Flush()
}

func (e *RespEncoder) EncodeError(arg string) (err error) {
  e.Write(errorCode)
  e.WriteString(arg)
  e.Write(lineEndingCode)

  return e.Flush()
}

func (e *RespEncoder) EncodeString(arg string) (err error) {
  e.Write(stringCode)
  e.WriteString(arg)
  e.Write(lineEndingCode)

  return e.Flush()
}

func (e *RespEncoder) EncodeBulkString(arg string) (err error) {
  e.Write(bulkStringCode)
  e.WriteString(strconv.Itoa(len(arg)))
  e.Write(lineEndingCode)
  e.WriteString(arg)
  e.Write(lineEndingCode)

  return e.Flush()
}
