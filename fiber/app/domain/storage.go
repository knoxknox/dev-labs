package domain

import (
	"errors"
	"fmt"
	"time"

	"github.com/google/uuid"
)

type Storage struct {
	orders map[string]Order
}

func NewStorage() *Storage {
	return &Storage{
		orders: make(map[string]Order),
	}
}

func (storage *Storage) GetOrder(id string) (Order, error) {
	order, ok := storage.orders[id]
	if ok {
		return order, nil
	}

	return Order{}, errors.New(fmt.Sprintf("Order %s not found", id))
}

func (storage *Storage) CreateOrder(name string) (Order, error) {
	uuid := uuid.New().String()
	storage.orders[uuid] = Order{
		ID:        uuid,
		Name:      name,
		CreatedAt: time.Now().Unix(),
	}

	return storage.GetOrder(uuid)
}
