import java.util.Random;
import java.math.BigInteger;

public class RabinKarp {
    private int m;            // pattern length
    private int R=256;        // ascii table size
    private long RM=1;        // precomputed: R^(M-1) % Q
    private long prime;       // a large random prime number
    private String pattern;   // string to search in provided text
    private long patternHash; // calculated hash value for the pattern

    public static void main(String[] args) {
        String text = args[0];
        String pattern = args[1];
        int offset = new RabinKarp(pattern).search(text);

        System.out.println(text);
        while (offset > 0) {
            offset--;
            System.out.print(" ");
        }
        System.out.println(pattern);
    }

    public RabinKarp(String pattern) {
        this.pattern = pattern;
        m = pattern.length();
        prime = randomPrime();
        patternHash = hash(pattern, m);
        for (int i = 1; i <= m-1; i++) RM = (R * RM) % prime;
    }

    public int search(String text) {
        int n = text.length();

        if (n < m) return n;
        long textHash = hash(text, m);

        // check for match at offset = 0
        if ((textHash == patternHash) && match(text, 0)) return 0;

        // check for hash match; if match, then check for exact match
        for (int i = m; i < n; i++) {
            int offset = i - m + 1;
            textHash = nextHash(textHash, text.charAt(i), text.charAt(i-m));
            if ((textHash == patternHash) && match(text, offset)) return offset;
        }

        return n;
    }

    private long hash(String key, int m) {
        long result = 0;
        for (int i = 0; i < m; i++) {
            result = (R * result + key.charAt(i)) % prime;
        }

        return result;
    }

    private boolean match(String text, int i) {
        for (int j = 0; j < m; j++) {
            if (text.charAt(i+j) != pattern.charAt(j)) return false;
        }

        return true;
    }

    private static long randomPrime() {
        return BigInteger.probablePrime(31, new Random()).longValue();
    }

    private long nextHash(long hash, char trailing, char leading) {
        return (R * (hash + prime - RM * leading % prime) + trailing) % prime;
    }

}
