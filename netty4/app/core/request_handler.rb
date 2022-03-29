require 'app/core/handler_finder'

java_import 'io.netty.util.ReferenceCountUtil'
java_import 'io.netty.handler.codec.http.HttpRequest'
java_import 'io.netty.channel.ChannelInboundHandlerAdapter'

module Labs
  class RequestHandler < ChannelInboundHandlerAdapter

    def channelRead(ctx, msg)
      if msg.kind_of?(HttpRequest)
        @handler = HandlerFinder::process(ctx, msg)
      end

      @handler.process(ctx, msg) if @handler && @handler.request
    ensure
      ReferenceCountUtil.release(msg) # http://netty.io/wiki/reference-counted-objects.html#wiki-h3-7
    end

    def channelReadComplete(ctx)
      ctx.flush
    end

  end
end
