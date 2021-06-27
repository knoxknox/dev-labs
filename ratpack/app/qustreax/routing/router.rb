module Qustreax
  module Routing
    class Router
      attr_reader :routes

      def initialize(routes)
        @routes = define_routes(routes)
      end

      def handle(ctx)
        route = route_path_for(ctx)
        routes[route.downcase].call(ctx)
      end


      private

      def route_path_for(ctx)
        "#{ctx.request.method} #{ctx.path_binding.description}"
      end

      def define_routes(routes)
        routes.each_with_object({}) do |route, result|
          route_path = "#{route.method} #{route.path}"
          result[route_path] = ->(ctx) { create_chain(ctx, *route.handlers) }
        end
      end

      def create_chain(ctx, *handlers)
        ctx.insert(*handlers.map { |handler| handler.new.to_java(Java::RatpackHandling::Handler) } )
      end

    end
  end
end
