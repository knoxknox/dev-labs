package cloud9.codec;

import cloud9.TimeStamp;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;

public class TimeStampEncoder extends MessageToByteEncoder<TimeStamp> {

  @Override
  protected void encode(ChannelHandlerContext ctx, TimeStamp msg, ByteBuf out) throws Exception {
    out.writeBytes(msg.toByteArray());
  }

}
