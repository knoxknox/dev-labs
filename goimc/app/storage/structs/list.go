package structs

import (
  "container/list"
)

type List struct {
  elements *list.List
}

func NewList() *List {
  return &List{
    elements: list.New(),
  }
}

func (this *List) Size() int {
  return this.elements.Len()
}

func (this *List) PopLast() string {
  el := this.elements.Back()
  this.elements.Remove(el)
  return this.nodeToString(el)
}

func (this *List) PopFirst() string {
  el := this.elements.Front()
  this.elements.Remove(el)
  return this.nodeToString(el)
}

func (this *List) Add(element string) {
  this.PushLast(element)
}

func (this *List) PushLast(element string) {
  this.elements.PushBack([]byte(element))
}

func (this *List) PushFirst(element string) {
  this.elements.PushFront([]byte(element))
}

func (this *List) Get() []string {
  els := this.elements
  elements := []string{}
  for el := els.Front(); el != nil; el = el.Next() {
    elements = append(elements, this.nodeToString(el))
  }

  return elements
}

func (this *List) Set(index int, value string) {
  this.fetch(index, func(el *list.Element) { el.Value = []byte(value) })
}

func (this *List) Remove(index int) {
  this.fetch(index, func(el *list.Element) { this.elements.Remove(el) })
}

func (this *List) nodeToString(el *list.Element) string {
  return string(el.Value.([]byte))
}

func (this *List) fetch(index int, callbackFunction func(*list.Element)) {
  el := this.elements.Front()
  for current := 0; el != nil; {
    if index == current {
      callbackFunction(el)
      break
    }
    el, current = el.Next(), current + 1
  }
}
