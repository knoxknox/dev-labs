package actions

import (
	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
	"github.com/knoxknox/dev-labs/fiber/app/domain"
	"github.com/sirupsen/logrus"
)

type Route struct {
	Ctx       *fiber.Ctx
	Storage   *domain.Storage
	Validator *validator.Validate
}

type Handler func(action *Route) error
type FiberResult func(ctx *fiber.Ctx) error

func (action *Route) Call(handler Handler) FiberResult {
	return func(ctx *fiber.Ctx) error {
		logrus.Info(ctx)
		action.Ctx = ctx
		return handler(action)
	}
}
