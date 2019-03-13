package cloud9;

import java.nio.ByteBuffer;

public class TimeStamp {
  private long sendTimeStamp;
  private long recvTimeStamp;

  static final int FIELD_SIZE = Long.SIZE / Byte.SIZE;
  public static final int PACKET_SIZE = FIELD_SIZE * 2;

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
    byte[] buf = new byte[PACKET_SIZE];
    byte[] buf1 = ByteBuffer.allocate(FIELD_SIZE).putLong(sendTimeStamp).array();
    byte[] buf2 = ByteBuffer.allocate(FIELD_SIZE).putLong(recvTimeStamp).array();

    for (int i = 0; i < FIELD_SIZE; i++) buf[i] = buf1[i];
    for (int i = 0; i < FIELD_SIZE; i++) buf[i + FIELD_SIZE] = buf2[i];

    return buf;
  }

  // Unpack 2 long numbers from 16 bytes array.
  // Every 8 bytes represents a single long number.
  public void fromByteArray(byte[] content) {
    if (content.length != PACKET_SIZE) return;

    ByteBuffer buf1 = ByteBuffer.allocate(FIELD_SIZE).put(content, 0, FIELD_SIZE);
    ByteBuffer buf2 = ByteBuffer.allocate(FIELD_SIZE).put(content, FIELD_SIZE, FIELD_SIZE);

    buf1.rewind();
    buf2.rewind();
    this.sendTimeStamp = buf1.getLong();
    this.recvTimeStamp = buf2.getLong();
  }

}
