package domain

import (
	"errors"
	"fmt"
	"math/rand"
	"time"
)

type Storage struct {
	orders map[int64]Order
}

func NewStorage() *Storage {
	return &Storage{
		orders: make(map[int64]Order),
	}
}

func (storage *Storage) GetOrder(id int64) (Order, error) {
	order, ok := storage.orders[id]
	if ok {
		return order, nil
	}

	return Order{}, errors.New(fmt.Sprintf("Order %d not found", id))
}

func (storage *Storage) CreateOrder(name string) (Order, error) {
	id := rand.Int63()
	storage.orders[id] = Order{
		ID:        id,
		Name:      name,
		CreatedAt: time.Now().Format(time.DateTime),
	}

	return storage.GetOrder(id)
}
