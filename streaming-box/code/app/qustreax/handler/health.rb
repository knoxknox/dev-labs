module Qustreax
  module Handler
    class Health

      def self.handle(ctx)
        ctx.response.status(200).send
      end

    end
  end
end
