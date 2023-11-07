package main

import (
	"fmt"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
)

func main() {
	app := fiber.New()

	app.Get("/users", func(ctx *fiber.Ctx) error {
		logrus.Info("Handle users page")
		return ctx.Status(http.StatusOK).SendString("Users page")
	})

	app.Get("/users/:id", func(ctx *fiber.Ctx) error {
		id := ctx.Params("id")
		logrus.Infof("Handle users %s page", id)
		return ctx.Status(http.StatusOK).SendString(fmt.Sprintf("Users %s page", id))
	})

	logrus.Fatal(app.Listen(":8080"))
}
