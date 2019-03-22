/**
 * java Brute abacadabrabracabracadabrabrabracad abracadabra
 * -> abacadabrabracabracadabrabrabracad
 * ->               abracadabra
 */
public class Brute {

    public static void main(String[] args) {
        String text = args[0];
        String pattern = args[1];
        int offset = search(text, pattern);

        System.out.println(text);
        while (offset > 0) {
            offset--;
            System.out.print(" ");
        }
        System.out.println(pattern);
    }

    public static int search(String text, String pattern) {
        int n = text.length();
        int m = pattern.length();

        for (int i = 0; i <= n - m; i++) {
            int j;
            for (j = 0; j < m; j++) {
                if (text.charAt(i+j) != pattern.charAt(j)) break;
            }

            if (j == m) return i; // return offset of first match
        }

        return n;
    }

}
