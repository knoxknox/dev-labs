package cloud9;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class ClientHandler extends ChannelInboundHandlerAdapter {

  @Override
  public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
    TimeStamp ts = (TimeStamp) msg;
    System.out.printf("received: %s\n", ts.toString());
    ctx.writeAndFlush(ts); // send received message back
  }

  @Override
  public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
    cause.printStackTrace();
    ctx.close(); // close connection on exception
  }

}
