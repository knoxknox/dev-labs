module Frack
  class Application
    class << self
      attr_accessor :env

      def call(env)
        self.env = env
        Rack::Response.new(*dispatch).to_a
      end

      private def dispatch
        controller.new(env).public_send(env['action'])
      end

      private def controller
        Object.const_get(env['controller'].capitalize + 'Controller')
      end
    end
  end
end
