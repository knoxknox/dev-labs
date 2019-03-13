package cloud9;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class ClientHandler extends ChannelInboundHandlerAdapter {

  @Override
  public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
    TimeStamp ts = (TimeStamp) msg;
    ctx.writeAndFlush(ts); // received message sent back directly

    System.out.printf("received: %s", ts.toString());
  }

  @Override
  public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
    cause.printStackTrace();
    ctx.close(); // close connection on exception
  }

}
