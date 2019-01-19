package cloud9;

import org.apache.commons.lang3.StringUtils;

public class App {
  public static void main(String[] args) {
    String version = Integer.toString(Version.get());
    System.out.println(StringUtils.lowerCase(version));
  }
}
