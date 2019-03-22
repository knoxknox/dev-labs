/**
 * java BoyerMoore abacadabrabracabracadabrabrabracad abracadabra
 * -> abacadabrabracabracadabrabrabracad
 * ->               abracadabra
 */
public class BoyerMoore {
    private int[] right;    // the bad-characted skip array
    private final int R;    // the radix (size of ascii table)
    private String pattern; // string to search in provided text

    public static void main(String[] args) {
        String text = args[0];
        String pattern = args[1];
        int offset = new BoyerMoore(pattern).search(text);

        System.out.println(text);
        while (offset > 0) {
            offset--;
            System.out.print(" ");
        }
        System.out.println(pattern);
    }

    public BoyerMoore(String pattern) {
        this.R = 256;
        this.pattern = pattern;

        right = new int[R];
        for (int c = 0; c < R; c++) right[c] = -1;
        // demo => [100, 101, 109, 111] => [100: 0, 101: 1, 109: 2, 111: 3]
        for (int j = 0; j < pattern.length(); j++) right[pattern.charAt(j)] = j;
    }

    public int search(String text) {
        int skip = 0;
        int n = text.length();
        int m = pattern.length();

        for (int i = 0; i <= n - m; i += skip) {
            skip = 0;
            for (int j = m-1; j >= 0; j--) {
                if (text.charAt(i+j) != pattern.charAt(j)) {
                    skip = Math.max(1, j - right[text.charAt(i+j)]);
                    break;
                }
            }

            if (skip == 0) return i; // return offset of first match
        }

        return n;
    }

}
