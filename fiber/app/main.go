package main

import (
	"fmt"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
)

func main() {
	app := fiber.New()

	app.Get("/", func(ctx *fiber.Ctx) error {
		logrus.Info("Handle index page")
		return ctx.Status(http.StatusOK).SendString("Index page")
	})

	app.Get("/:id", func(ctx *fiber.Ctx) error {
		id := ctx.Query("id")
		logrus.Infof("Handle details page id=%s", id)
		return ctx.Status(http.StatusOK).SendString(fmt.Sprintf("Details page id=%s", id))
	})

	logrus.Fatal(app.Listen(":8080"))
}
