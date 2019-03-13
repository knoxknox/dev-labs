package cloud9;

import java.nio.ByteBuffer;

public class TimeStamp {
  private long sendTimeStamp;
  private long recvTimeStamp;
  final int BUF_SIZE = Long.SIZE / Byte.SIZE;

  public TimeStamp() {
    this.sendTimeStamp = System.nanoTime();
  }

  public long timeDiffInNanoSecond() {
    return recvTimeStamp - sendTimeStamp;
  }

  public void setRecvTimeStamp(long timestamp) {
    this.recvTimeStamp = timestamp;
  }

  // Pack 2 long numbers to a 16 bytes array.
  // Every 8 bytes represents a single long number.
  public byte[] toByteArray() {
    byte[] ba = new byte[BUF_SIZE * 2];
    byte[] t1 = ByteBuffer.allocate(BUF_SIZE).putLong(sendTimeStamp).array();
    byte[] t2 = ByteBuffer.allocate(BUF_SIZE).putLong(recvTimeStamp).array();

    for (int i = 0; i < BUF_SIZE; i++) ba[i] = t1[i];
    for (int i = 0; i < BUF_SIZE; i++) ba[i + BUF_SIZE] = t2[i];

    return ba;
  }

  // Unpack 2 long numbers from 16 bytes array.
  // Every 8 bytes represents a single long number.
  public void fromByteArray(byte[] content) {
    if (content.length != BUF_SIZE * 2) return;

    ByteBuffer b1 = ByteBuffer.allocate(BUF_SIZE).put(content, 0, BUF_SIZE);
    ByteBuffer b2 = ByteBuffer.allocate(BUF_SIZE).put(content, BUF_SIZE, BUF_SIZE);

    b1.rewind();
    b2.rewind();
    this.sendTimeStamp = b1.getLong();
    this.recvTimeStamp = b2.getLong();
  }

}
