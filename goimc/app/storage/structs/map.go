package structs

type Map struct {
  elements map[string][]byte
}

func NewMap() *Map {
  return &Map{
    elements: make(map[string][]byte),
  }
}

func (this *Map) Get(key string) string {
  return string(this.elements[key])
}

func (this *Map) Set(key string, value string) {
  this.elements[key] = []byte(value)
}
