module Qustreax
  module Handler
    class Auth

      def self.handle(ctx)
        headers = ctx.request.headers
        auth_token = headers.get('Auth-Token')

        if auth_token == 'SECRET'
          ctx.next
        else
          ctx.response.status(401).send('unauthorized')
        end
      end

    end
  end
end
