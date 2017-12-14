import java.util.Random;

public class App {

  public void randomize() {
    Random rand = new Random();
    increment(rand.nextInt(50));
  }

  public int increment(int v) {
    return v > 10 ? v + 1 : v + 2;
  }

  public static void main(String[] args) throws Exception {
    App app = new App();

    while (true) {
      app.randomize();
      Thread.sleep(1000);
    }
  }

}
