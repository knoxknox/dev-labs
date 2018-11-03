module Qustreax
  module Handler
    class Filter

      def handle(ctx)
        percentage = rand(1..100)

        if percentage > 50
          ctx.next
        else
          ctx.render('processing of request was stopped')
        end
      end

    end
  end
end
