package middleware

import (
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/requestid"
	"github.com/sirupsen/logrus"
)

func Logger() fiber.Handler {
	return func(ctx *fiber.Ctx) error {
		start := time.Now()
		rid := ctx.Locals(requestid.ConfigDefault.ContextKey)
		ctx.Locals("logger", logrus.WithField("request_id", rid))

		err := ctx.Next()

		logrus.Infof(
			"request_id=%v method=%s path=%s status=%d duration=%s",
			rid,
			ctx.Method(),
			ctx.Path(),
			ctx.Response().StatusCode(),
			time.Since(start),
		)

		return err
	}
}
