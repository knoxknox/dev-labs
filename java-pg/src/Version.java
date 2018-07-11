package c9;

import java.util.Random;

public class Version {
  public static int get() {
    Random random = new Random();
    return random.nextInt(50) + 1;
  }
}
