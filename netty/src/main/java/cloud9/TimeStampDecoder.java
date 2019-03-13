package cloud9.codec;

import java.util.List;
import cloud9.TimeStamp;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

public class TimeStampDecoder extends ByteToMessageDecoder {
  final int MESSAGE_SIZE = Long.SIZE / Byte.SIZE * 2;

  @Override
  protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
    if (in.readableBytes() < MESSAGE_SIZE) return;

    byte[] messageBuffer = new byte[MESSAGE_SIZE];
    in.readBytes(messageBuffer, 0, MESSAGE_SIZE); // block until read 16 bytes from socket

    TimeStamp timestamp = new TimeStamp();
    timestamp.fromByteArray(messageBuffer);
    out.add(timestamp);
  }

}
