module Labs
  class NotFoundHandler < BaseHandler

    def process(ctx, msg)
      if msg.kind_of?(HttpRequest)
        send_error(ctx, status: HttpResponseStatus::NOT_FOUND)
      end
    end

  end
end
