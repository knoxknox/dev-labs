module Qustreax
  module Routing
    class Router

      def self.chain
        @chain ||= RoutesMap.new
      end

      def self.handle(ctx)
        type = ctx.request.method
        path = ctx.path_binding.description

        route = "#{type} #{path}"
        chain.handlers[route.downcase].call(ctx)
      end

    end
  end
end
