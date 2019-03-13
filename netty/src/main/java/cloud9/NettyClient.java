package cloud9;

import cloud9.codec.TimeStampDecoder;
import cloud9.codec.TimeStampEncoder;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;

public class NettyClient {

  public static void main(String[] args) {
    Bootstrap bootstrap = new Bootstrap();
    NioEventLoopGroup workerGroup = new NioEventLoopGroup();

    bootstrap.group(workerGroup);
    bootstrap.channel(NioSocketChannel.class);
    bootstrap.handler(new ChannelInitializer<SocketChannel>() {
      @Override
      public void initChannel(SocketChannel ch) throws Exception {
        ch.pipeline().addLast(new TimeStampEncoder(), new TimeStampDecoder(), new ClientHandler());
      }
    });

    bootstrap.connect("0.0.0.0", 8088);
  }

}
