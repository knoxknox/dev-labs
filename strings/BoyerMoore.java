/**
 * java BoyerMoore abacadabrabracabracadabrabrabracad abracadabra
 * -> abacadabrabracabracadabrabrabracad
 * ->               abracadabra
 */
public class BoyerMoore {
    private int[] right;               // the bad-characted skip array
    private String pattern;            // string to search in provided text
    private final int ASCII_CHARS=256; // number of characters in ascii table

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
        this.pattern = pattern;
        right = new int[ASCII_CHARS];

        // initialize all occurrences as -1
        for (int i = 0; i < ASCII_CHARS; i++) right[i] = -1;
        // fill the actual value of last occurrence of a character
        // demo => [100, 101, 109, 111] => [100: 0, 101: 1, 109: 2, 111: 3]
        for (int j = 0; j < pattern.length(); j++) right[pattern.charAt(j)] = j;
    }

    public int search(String text) {
        int skip = 0;
        int n = text.length();
        int m = pattern.length();

        for (int i = 0; i <= n - m; i += skip) {
            skip = 0;
            for (int j = m-1; j >= 0; j--) { // from end
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
