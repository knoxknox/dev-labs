package actions

import (
	"fmt"
	"net/http"
)

func DeleteOrder(route *Route) error {
	id := route.Ctx.Params("id")

	if err := route.Storage.DeleteOrder(id); err != nil {
		return route.Ctx.Status(http.StatusNotFound).JSON(fmt.Sprintf("Could not find order with id=%s", id))
	}

	return route.Ctx.SendStatus(http.StatusNoContent)
}
