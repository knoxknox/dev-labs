package resp

import (
  "io"
  "bufio"
  "errors"
  "strconv"
)

type Command struct {
  Name string
  Key  string
  Args []string
}

type RespDecoder struct {
  *bufio.Reader
}

func NewDecoder(reader io.Reader) *RespDecoder {
  return &RespDecoder{
    Reader: bufio.NewReaderSize(reader, 32*1024),
  }
}

func (d *RespDecoder) Parse() (*Command, error) {
  line, err := d.readLine()
  if err != nil {
    if err == io.EOF {
      return nil, err
    }
    return nil, errors.New("Invalid package")
  }

  count, err := d.toInt(line[1:])
  if err != nil {
    return nil, errors.New("Invalid package size")
  }

  result, err := d.parse(count * 2)
  if err != nil || len(result) < 2 {
    return nil, errors.New("Invalid package body")
  }

  return &Command{result[0], result[1], result[2:]}, nil
}

func (d *RespDecoder) parse(parts int) ([]string, error) {
  commandLength := 0
  result := []string{}
  for i := 0; i < parts; i++ {
    buf, err := d.readLine()
    if err != nil {
      if err == io.EOF {
        return nil, err
      }
      return nil, errors.New("Invalid part of package")
    }

    if buf[0] == '$' {
      commandLength, _ = d.toInt(buf[1:])
      continue
    }

    if len(buf) != commandLength {
      return nil, errors.New("Invalid length of command")
    }

    result = append(result, string(buf))
  }

  return result, nil
}

func (d *RespDecoder) toInt(bytes []byte) (int, error) {
  return strconv.Atoi(string(bytes))
}

func (d *RespDecoder) readLine() (line []byte, err error) {
  line, err = d.ReadBytes('\n')

  if err != nil {
    if err == io.EOF {
      return nil, err
    }
    return nil, errors.New("Line cannot be read")
  }

  if len(line) < 4 {
    return nil, errors.New("Incorrect line, too short")
  }

  ending := len(line) - 2
  if line[ending] != '\r' {
    return nil, errors.New("Incorrect line ending (CRLF)")
  }

  return line[:ending], nil
}
