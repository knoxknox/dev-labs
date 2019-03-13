package cloud9.codec;

import java.util.List;
import cloud9.TimeStamp;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

public class TimeStampDecoder extends ByteToMessageDecoder {

  @Override
  protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
    if (in.readableBytes() < TimeStamp.MSG_SIZE) return;

    byte[] buffer = new byte[TimeStamp.MSG_SIZE];
    in.readBytes(buffer, 0, TimeStamp.MSG_SIZE); // block until read 16 bytes from socket

    TimeStamp timestamp = new TimeStamp();
    timestamp.fromByteArray(buffer);
    out.add(timestamp);
  }

}
