package actions

import (
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
)

type PostOrderRequest struct {
	Name string `json:"name"`
}

type PostOrderResponse struct {
	ID        string `json:"uuid"`
	Name      string `json:"name"`
	CreatedAt int64  `json:"created_at"`
}

func PostOrder(route *Route) error {
	var request PostOrderRequest
	if err := route.Ctx.BodyParser(&request); err != nil {
		logrus.WithError(err).Error("Could not parse JSON")
		return route.Ctx.Status(http.StatusBadRequest).JSON(fiber.Map{"error": "JSON parse error"})
	}

	storage := route.Storage
	order, err := storage.CreateOrder(request.Name)
	if err != nil {
		logrus.WithError(err).Error("Could not create order")
		return route.Ctx.Status(http.StatusInternalServerError).JSON(fiber.Map{"error": "Could not create order"})
	}

	return route.Ctx.JSON(PostOrderResponse{
		ID:        order.ID,
		Name:      order.Name,
		CreatedAt: order.CreatedAt,
	})
}
