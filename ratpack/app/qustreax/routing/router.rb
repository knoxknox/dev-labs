module Qustreax
  module Routing
    class Router

      def initialize(routes)
        @routes = routes
      end

      def create(chain)
        chain.get 'health', @routes
        chain.get 'protected', @routes
        chain.get 'protected/:id', @routes
      end

    end
  end
end
