module Qustreax
  module Handler
    class Protected

      def handle(ctx)
        ctx.render('protected')
      end

    end
  end
end
