module Qustreax
  module Handler
    class Auth

      def self.handle(ctx)
        ctx.next
      end

    end
  end
end
