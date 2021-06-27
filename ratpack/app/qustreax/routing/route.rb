module Qustreax
  module Routing
    class Route
      attr_reader :path, :method, :handlers

      def initialize(method, path, handlers)
        @path = path.is_a?(String) ? path : fail('Incorrect route path')
        @method = method.is_a?(Symbol) ? method : fail('Incorrect route method')
        @handlers = handlers.is_a?(Array) ? handlers : fail('Incorrect route handlers')
      end

    end
  end
end
