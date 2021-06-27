module Qustreax
  module Routing
    class Routes

      def self.load
        [
          Route.new(:get, 'health', [Handler::Filter, Handler::Health]),
          Route.new(:get, 'protected', [Handler::Auth, Handler::Filter, Handler::Protected]),
          Route.new(:get, 'protected/:id', [Handler::Auth, Handler::Filter, Handler::Protected])
        ]
      end

    end
  end
end
