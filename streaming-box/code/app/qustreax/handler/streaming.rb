module Qustreax
  module Handler
    class Streaming

      def self.handle(ctx)
        ctx.getResponse.status(200).send
      end

    end
  end
end
