package actions

import (
	"fmt"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
)

type PutOrderRequest struct {
	Name string `json:"name"`
}

type PutOrderResponse struct {
	ID        string `json:"uuid"`
	Name      string `json:"name"`
	CreatedAt int64  `json:"created_at"`
}

func PutOrder(route *Route) error {
	id := route.Ctx.Params("id")

	var request PutOrderRequest
	if err := route.Ctx.BodyParser(&request); err != nil {
		logrus.WithError(err).Error("Could not parse JSON")
		return route.Ctx.Status(http.StatusBadRequest).JSON(fiber.Map{"error": "JSON parse error"})
	}

	order, err := route.Storage.UpdateOrder(id, request.Name)
	if err != nil {
		return route.Ctx.Status(http.StatusNotFound).JSON(fmt.Sprintf("Could not find order with id=%s", id))
	}

	return route.Ctx.JSON(PutOrderResponse{
		ID:        order.ID,
		Name:      order.Name,
		CreatedAt: order.CreatedAt,
	})
}
