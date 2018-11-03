module Qustreax
  module Handler
    class Protected

      def self.handle(ctx)
        ctx.render('protected')
      end

    end
  end
end
