package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/knoxknox/dev-labs/fiber/app/actions"
	"github.com/knoxknox/dev-labs/fiber/app/domain"
	"github.com/sirupsen/logrus"
)

func main() {
	app := fiber.New()
	storage := domain.NewStorage()
	action := &actions.Route{Storage: storage}

	app.Post("/orders", action.Call(actions.PostOrder))
	app.Get("/orders/:id", action.Call(actions.GetOrder))

	logrus.Fatal(app.Listen(":8080"))
}
