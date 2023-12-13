package actions

import (
	"fmt"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
)

type GetOrderResponse struct {
	ID        int64  `json:"id"`
	Name      string `json:"name"`
	CreatedAt string `json:"created_at"`
}

func GetOrder(route *Route) error {
	id, err := route.Ctx.ParamsInt("id")
	if err != nil {
		logrus.WithError(err).Error("Could not parse id param")
		return route.Ctx.Status(http.StatusBadRequest).JSON(fiber.Map{"error": "Incorrect id param"})
	}

	storage := route.Storage
	order, err := storage.GetOrder(int64(id))
	if err != nil {
		logrus.Infof("Could not find order with id=%d", id)
		return route.Ctx.Status(http.StatusNotFound).JSON(fmt.Sprintf("Could not find order with id=%d", id))
	}

	return route.Ctx.JSON(GetOrderResponse{
		ID:        order.ID,
		Name:      order.Name,
		CreatedAt: order.CreatedAt,
	})
}
