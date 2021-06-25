module Qustreax
  module Routing
    class Routes

      def self.load
        [
          {
            method: :get,
            path: 'health',
            handlers: [Handler::Filter, Handler::Health]
          },
          {
            method: :get,
            path: 'protected',
            handlers: [Handler::Auth, Handler::Filter, Handler::Protected]
          },
          {
            method: :get,
            path: 'protected/:id',
            handlers: [Handler::Auth, Handler::Filter, Handler::Protected]
          }
        ]
      end

    end
  end
end
