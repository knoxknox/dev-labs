module Qustreax
  module Routing
    class Routes
      attr_reader :routes

      def initialize
        @routes = RoutesMap.new
      end

      def handle(ctx)
        route = route_path_for(ctx)
        routes.handlers[route.downcase].call(ctx)
      end


      private

      def route_path_for(ctx)
        "#{ctx.request.method} #{ctx.path_binding.description}"
      end

    end
  end
end
