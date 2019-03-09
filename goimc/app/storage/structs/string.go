package structs

type String struct {
  bytes []byte
}

func NewString() *String {
  return &String{}
}

func (this *String) Get() string {
  return string(this.bytes)
}

func (this *String) Set(value string) {
  this.bytes = []byte(value)
}
