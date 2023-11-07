package main

import (
	"fmt"
	"math/rand"
	"net/http"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
)

type User struct {
	ID    int64
	Name  string
	Email string
}

type CreateUserRequest struct {
	Name     string `json:"name"`
	Email    string `json:"email"`
	ParentID int64  `json:"parent_id,omitempty"`
}

type CreateUserResponse struct {
	ID        int64  `json:"id"`
	Name      string `json:"name"`
	Timestamp string `json:"created_at,omitempty"`
}

var users []User

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

	app.Post("/users", func(ctx *fiber.Ctx) error {
		var request CreateUserRequest
		if err := ctx.BodyParser(&request); err != nil {
			logrus.WithError(err).Error("Could not parse JSON")
			return ctx.Status(http.StatusBadRequest).JSON(fiber.Map{"error": "JSON parse error"})
		}

		user := User{
			ID:    rand.Int63(),
			Name:  request.Name,
			Email: request.Email,
		}
		users = append(users, user)
		logrus.Infof("Add user %s", user.Email)

		return ctx.JSON(CreateUserResponse{
			ID:        user.ID,
			Name:      user.Name,
			Timestamp: time.Now().Format(time.DateTime),
		})
	})

	logrus.Fatal(app.Listen(":8080"))
}
