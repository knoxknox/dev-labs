package cloud9;

import cloud9.codec.TimeStampDecoder;
import cloud9.codec.TimeStampEncoder;

import java.io.IOException;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.handler.timeout.IdleStateHandler;
import io.netty.util.concurrent.EventExecutorGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.util.concurrent.DefaultEventExecutorGroup;

public class NettyServer {

  public static void main(String[] args) throws IOException, InterruptedException {
    ServerBootstrap bootstrap = new ServerBootstrap();
    NioEventLoopGroup bossGroup = new NioEventLoopGroup();
    NioEventLoopGroup workerGroup = new NioEventLoopGroup();
    // ThreadPool to execute handlers with slow business logic.
    final EventExecutorGroup executors = new DefaultEventExecutorGroup(1024);

    bootstrap.group(bossGroup, workerGroup);
    bootstrap.channel(NioServerSocketChannel.class);
    bootstrap.childHandler(new ChannelInitializer<SocketChannel>() {
      @Override
      protected void initChannel(SocketChannel ch) throws Exception {
        ChannelPipeline pipeline = ch.pipeline();
        pipeline.addLast("idle", new IdleStateHandler(0, 0, 5));
        pipeline.addLast("package encoder", new TimeStampEncoder());
        pipeline.addLast("package decoder", new TimeStampDecoder());

        // Run handler in separate thread from I/O thread.
        pipeline.addLast(executors, "handler", new ServerHandler());
      }
    });

    bootstrap.childOption(ChannelOption.SO_KEEPALIVE, true);
    bootstrap.bind(8088).sync(); // listen on address 0.0.0.0:8088
  }

}
