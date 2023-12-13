package actions

import (
	"fmt"
	"net/http"
)

type GetOrderResponse struct {
	ID        string `json:"uuid"`
	Name      string `json:"name"`
	CreatedAt int64  `json:"created_at"`
}

func GetOrder(route *Route) error {
	id := route.Ctx.Params("id")

	storage := route.Storage
	order, err := storage.GetOrder(id)
	if err != nil {
		return route.Ctx.Status(http.StatusNotFound).JSON(fmt.Sprintf("Could not find order with id=%s", id))
	}

	return route.Ctx.JSON(GetOrderResponse{
		ID:        order.ID,
		Name:      order.Name,
		CreatedAt: order.CreatedAt,
	})
}
