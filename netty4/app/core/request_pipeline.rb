require 'app/core/request_handler'

java_import 'java.util.concurrent.Executors'
java_import 'io.netty.channel.ChannelInitializer'
java_import 'io.netty.handler.codec.http.HttpServerCodec'
java_import 'io.netty.handler.traffic.GlobalTrafficShapingHandler'

module Labs
  class RequestPipeline < ChannelInitializer

    def initialize
      executor = Executors.new_scheduled_thread_pool(1)
      @traffic = GlobalTrafficShapingHandler.new(executor, 1000)
    end

    def initChannel(channel)
      pipeline = channel.pipeline
      pipeline.add_last('traffic', @traffic)
      pipeline.add_last('codec', HttpServerCodec.new)
      pipeline.add_last('request', RequestHandler.new)
    end

  end
end
