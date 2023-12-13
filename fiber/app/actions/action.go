package actions

import (
	"github.com/gofiber/fiber/v2"
	"github.com/knoxknox/dev-labs/fiber/app/domain"
)

type Route struct {
	Ctx     *fiber.Ctx
	Storage *domain.Storage
}

type Handler func(action *Route) error
type FiberResult func(ctx *fiber.Ctx) error

func (action *Route) Call(handler Handler) FiberResult {
	return func(ctx *fiber.Ctx) error {
		action.Ctx = ctx
		return handler(action)
	}
}
