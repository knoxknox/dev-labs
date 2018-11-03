module Qustreax
  module Routing
    class Routes

      def self.define_chain(chain)
        chain.get 'health', Router
        chain.get 'protected', Router
        chain.get 'protected/:id', Router
      end

    end
  end
end
