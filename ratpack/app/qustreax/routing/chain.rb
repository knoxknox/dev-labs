module Qustreax
  module Routing
    class Chain

      def initialize(chain, routes)
        router = Router.new(routes)

        routes.each do |route|
          chain.public_send(route[:method], route[:path], router)
        end
      end

    end
  end
end
