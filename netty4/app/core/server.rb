require 'app/core/request_pipeline'

java_import 'io.netty.channel.ChannelOption'
java_import 'io.netty.bootstrap.ServerBootstrap'
java_import 'io.netty.channel.nio.NioEventLoopGroup'
java_import 'io.netty.channel.socket.nio.NioServerSocketChannel'

##
# Main class for HTTP Netty server, it works as described below:
# server > request_pipeline > request_handler > handler_finder > handler.process
#
module Labs
  class Server

    def initialize
      @bootstrap = ServerBootstrap.new
      @boss_group = NioEventLoopGroup.new
      @worker_group = NioEventLoopGroup.new

      @bootstrap
        .group(@boss_group, @worker_group)
        .child_handler(RequestPipeline.new)
        .channel(NioServerSocketChannel.java_class)

      @bootstrap.option(ChannelOption::SO_BACKLOG,
        configatron.app.backlog_size.to_java(Java::int))
    end

    def listen(port)
      channel = @bootstrap.bind(port).sync.channel
      puts "Waiting for new connections at :#{port}"

      channel.close_future.sync
    ensure
      @boss_group.shutdown_gracefully
      @worker_group.shutdown_gracefully
    end

  end
end
