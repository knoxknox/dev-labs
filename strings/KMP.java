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

        int j = -1;
        next = new int[m];
        for (int i = 0; i < m; i++) {
            if (i == 0)                                      next[i] = -1;
            else if (pattern.charAt(i) != pattern.charAt(j)) next[i] = j;
            else                                             next[i] = next[j];
            while (j >= 0 && pattern.charAt(i) != pattern.charAt(j)) j = next[j];

            j++;
        }
    }

    public int search(String text) {
        int n = text.length();
        int m = pattern.length();

        int i, j;
        for (i = 0, j = 0; i < n && j < m; i++) {
            while (j >= 0 && text.charAt(i) != pattern.charAt(j)) j = next[j];

            j++;
        }

        return (j == m) ? (i - m) : n; // offset of first match or n
    }
}
