package actions

type ListOrdersResponse struct {
	ID        string `json:"uuid"`
	Name      string `json:"name"`
	CreatedAt int64  `json:"created_at"`
}

func ListOrders(route *Route) error {
	orders := route.Storage.ListOrders()
	response := make([]ListOrdersResponse, 0, len(orders))

	for _, order := range orders {
		response = append(response, ListOrdersResponse{
			ID:        order.ID,
			Name:      order.Name,
			CreatedAt: order.CreatedAt,
		})
	}

	return route.Ctx.JSON(response)
}
