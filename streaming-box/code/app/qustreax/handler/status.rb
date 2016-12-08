module Qustreax
  module Handler
    class Status

      def self.handle(ctx)
        ctx.render('no content')
      end

    end
  end
end
