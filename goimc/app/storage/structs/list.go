package structs

type List struct {
  elements [][]byte
}

func NewList() *List {
  return &List{
    elements: [][]byte{},
  }
}

func (this *List) Get() []string {
  elements := []string{}
  for _, el := range this.elements {
    elements = append(elements, string(el))
  }

  return elements
}

func (this *List) Set(element string) {
  this.elements = append(this.elements, []byte(element))
}
