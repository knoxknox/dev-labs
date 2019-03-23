/**
 * java KMP abacadabrabracabracadabrabrabracad abracadabra
 * -> abacadabrabracabracadabrabrabracad
 * ->               abracadabra
 */
public class KMP {
    private int[] next;
    private String pattern;

    public static void main(String[] args) {
        String text = args[0];
        String pattern = args[1];
        int offset = new KMP(pattern).search(text);

        System.out.println(text);
        while (offset > 0) {
            offset--;
            System.out.print(" ");
        }
        System.out.println(pattern);
    }

    // Create NFA from pattern
    public KMP(String pattern) {
        this.pattern = pattern;
        int m = pattern.length();

        next = new int[m];

        int i, j;
        next[0] = -1;
        for (i = 0, j = -1; i < m; i++, j++) {
            if (i == 0) continue;
            next[i] = (pattern.charAt(i) == pattern.charAt(j)) ? next[j] : j;
            while (j >= 0 && pattern.charAt(i) != pattern.charAt(j)) j = next[j];
        }
    }

    public int search(String text) {
        int n = text.length();
        int m = pattern.length();

        int i, j;
        for (i = 0, j = 0; i < n && j < m; i++, j++) {
            while (j >= 0 && text.charAt(i) != pattern.charAt(j)) j = next[j];
        }

        return (j == m) ? (i - m) : n; // offset of first match or length of text
    }
}
