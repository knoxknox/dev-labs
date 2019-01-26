module Qustreax
  module Handler
    class Health

      def handle(ctx)
        ctx.response.status(200).send
      end

    end
  end
end
