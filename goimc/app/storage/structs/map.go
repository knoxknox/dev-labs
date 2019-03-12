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

func (this *Map) Remove(key string) {
  delete(this.elements, key)
}

func (this *Map) Values() []string {
  idx := -1
  size := len(this.elements)
  result := make([]string, size)
  for key, value := range this.elements {
    idx += 1
    result[idx] = key + ":" + string(value)
  }

  return result
}
