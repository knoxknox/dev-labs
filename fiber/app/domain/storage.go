package domain

import (
	"errors"
	"fmt"
	"sync"
	"time"

	"github.com/google/uuid"
)

type Storage struct {
	mutex  *sync.RWMutex
	orders map[string]Order
}

func NewStorage() *Storage {
	return &Storage{
		mutex:  &sync.RWMutex{},
		orders: make(map[string]Order),
	}
}

func (storage *Storage) GetOrder(id string) (Order, error) {
	storage.mutex.RLock()
	defer storage.mutex.RUnlock()

	order, ok := storage.orders[id]
	if ok {
		return order, nil
	}

	return Order{}, errors.New(fmt.Sprintf("Order %s not found", id))
}

func (storage *Storage) ListOrders() []Order {
	storage.mutex.RLock()
	defer storage.mutex.RUnlock()

	orders := make([]Order, 0, len(storage.orders))
	for _, order := range storage.orders {
		orders = append(orders, order)
	}

	return orders
}

func (storage *Storage) CreateOrder(name string) (Order, error) {
	storage.mutex.Lock()
	uuid := uuid.New().String()
	storage.orders[uuid] = Order{
		ID:        uuid,
		Name:      name,
		CreatedAt: time.Now().Unix(),
	}

	storage.mutex.Unlock()
	return storage.GetOrder(uuid)
}

func (storage *Storage) UpdateOrder(id string, name string) (Order, error) {
	storage.mutex.Lock()
	defer storage.mutex.Unlock()

	order, ok := storage.orders[id]
	if !ok {
		return Order{}, errors.New(fmt.Sprintf("Order %s not found", id))
	}

	order.Name = name
	storage.orders[id] = order

	return order, nil
}

func (storage *Storage) DeleteOrder(id string) error {
	storage.mutex.Lock()
	defer storage.mutex.Unlock()

	if _, ok := storage.orders[id]; !ok {
		return errors.New(fmt.Sprintf("Order %s not found", id))
	}

	delete(storage.orders, id)

	return nil
}
