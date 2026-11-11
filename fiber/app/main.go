package main

import (
	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/requestid"
	"github.com/knoxknox/dev-labs/fiber/app/actions"
	"github.com/knoxknox/dev-labs/fiber/app/domain"
	"github.com/knoxknox/dev-labs/fiber/app/middleware"
	"github.com/sirupsen/logrus"
)

func main() {
	app := fiber.New()
	app.Use(requestid.New())
	app.Use(middleware.Logger())

	storage := domain.NewStorage()
	action := &actions.Route{Storage: storage, Validator: validator.New()}

	app.Get("/orders", action.Call(actions.ListOrders))
	app.Post("/orders", action.Call(actions.PostOrder))

	app.Get("/orders/:id", action.Call(actions.GetOrder))
	app.Put("/orders/:id", action.Call(actions.PutOrder))
	app.Delete("/orders/:id", action.Call(actions.DeleteOrder))

	logrus.Fatal(app.Listen(":8080"))
}
