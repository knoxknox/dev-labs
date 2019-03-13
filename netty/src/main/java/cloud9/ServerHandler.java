package cloud9;

import io.netty.handler.timeout.IdleState;
import io.netty.handler.timeout.IdleStateEvent;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

public class ServerHandler extends ChannelInboundHandlerAdapter {

  @Override
  public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
    TimeStamp ts = (TimeStamp) msg;
    ts.setRecvTimeStamp(System.nanoTime());

    System.out.printf("delay (ms): %s", 1.0 * ts.timeDiffInNanoSecond() / 1000000L);
  }

  @Override
  public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
    if (!(evt instanceof IdleStateEvent)) return;
    IdleStateEvent idleEvent = (IdleStateEvent) evt;
    if (idleEvent.state() == IdleState.ALL_IDLE) {
      ctx.writeAndFlush(new TimeStamp()); // idle for no read/write
    }
  }

  @Override
  public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
    cause.printStackTrace();
    ctx.close(); // close connection on exception
  }

}
