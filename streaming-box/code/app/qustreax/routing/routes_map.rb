module Qustreax
  module Routing
    class RoutesMap

      def handlers
        @handlers ||= define_handlers
      end


      private

      def define_handlers
        {
          'get health' => ->(ctx) {
            chain(ctx, Handler::Filter, Handler::Health)
          },
          'get protected' => ->(ctx) {
            chain(ctx, Handler::Auth, Handler::Filter, Handler::Protected)
          },
          'get protected/:id' => ->(ctx) {
            chain(ctx, Handler::Auth, Handler::Filter, Handler::Protected)
          }
        }
      end

      def chain(ctx, *actions)
        ctx.insert(*actions.map { |x| x.new.to_java(Java::RatpackHandling::Handler) } )
      end

    end
  end
end
