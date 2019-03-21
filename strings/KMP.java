/******************************************************************************
 *  Compilation:  javac KMP.java
 *  Execution:    java KMP pattern text
 *  Dependencies: StdOut.java
 *
 *  Reads in two strings, the pattern and the input text, and
 *  searches for the pattern in the input text using the
 *  KMP algorithm.
 *
 *  % java KMP abracadabra abacadabrabracabracadabrabrabracad
 *  text:    abacadabrabracabracadabrabrabracad
 *  pattern:               abracadabra
 *
 *  % java KMP rab abacadabrabracabracadabrabrabracad
 *  text:    abacadabrabracabracadabrabrabracad
 *  pattern:         rab
 *
 *  % java KMP bcara abacadabrabracabracadabrabrabracad
 *  text:    abacadabrabracabracadabrabrabracad
 *  pattern:                                   bcara
 *
 *  % java KMP rabrabracad abacadabrabracabracadabrabrabracad
 *  text:    abacadabrabracabracadabrabrabracad
 *  pattern:                        rabrabracad
 *
 *  % java KMP abacad abacadabrabracabracadabrabrabracad
 *  text:    abacadabrabracabracadabrabrabracad
 *  pattern: abacad
 *
 ******************************************************************************/

/**
 *  The {@code KMP} class finds the first occurrence of a pattern string
 *  in a text string.
 *  <p>
 *  This implementation uses a version of the Knuth-Morris-Pratt substring search
 *  algorithm. The version takes time proportional to <em>n</em> + <em>m R</em>
 *  in the worst case, where <em>n</em> is the length of the text string,
 *  <em>m</em> is the length of the pattern, and <em>R</em> is the alphabet size.
 *  It uses extra space proportional to <em>m R</em>.
 *  <p>
 *  For additional documentation,
 *  see <a href="https://algs4.cs.princeton.edu/53substring">Section 5.3</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
public class KMP {
    private final int R;       // the radix
    private int[][] dfa;       // the KMP automoton
    private String pat;        // pattern string

    /**
     * Preprocesses the pattern string.
     *
     * @param pat the pattern string
     */
    public KMP(String pat) {
        this.R = 256;
        this.pat = pat;

        // build DFA from pattern
        int m = pat.length();
        dfa = new int[R][m];
        dfa[pat.charAt(0)][0] = 1;
        for (int x = 0, j = 1; j < m; j++) {
            for (int c = 0; c < R; c++)
                dfa[c][j] = dfa[c][x];     // Copy mismatch cases.
            dfa[pat.charAt(j)][j] = j+1;   // Set match case.
            x = dfa[pat.charAt(j)][x];     // Update restart state.
        }
    }

    /**
     * Returns the index of the first occurrrence of the pattern string
     * in the text string.
     *
     * @param  txt the text string
     * @return the index of the first occurrence of the pattern string
     *         in the text string; N if no such match
     */
    public int search(String txt) {
        int m = pat.length();
        int n = txt.length();
        int i, j;
        for (i = 0, j = 0; i < n && j < m; i++) {
            j = dfa[txt.charAt(i)][j];
        }
        if (j == m) return i - m;    // found
        return n;                    // not found
    }

    /**
     * Takes a pattern string and an input string as command-line arguments;
     * searches for the pattern string in the text string; and prints
     * the first occurrence of the pattern string in the text string.
     *
     * @param args the command-line arguments
     */
    public static void main(String[] args) {
        String pat = args[0];
        String txt = args[1];

        KMP kmp = new KMP(pat);
        int offset = kmp.search(txt);
        StdOut.println("text: " + txt);

        StdOut.print("pattern: ");
        for (int i = 0; i < offset; i++)
            StdOut.print(" ");
        StdOut.println(pat);
    }
}
