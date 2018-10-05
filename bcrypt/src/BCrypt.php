<?php

/**
 * This class is a wrapper to simplify the use of bcrypt algorithm in PHP.
 *
 * See next articles for more details:
 * http://codahale.com/a-lesson-in-timing-attacks
 * http://chargen.matasano.com/chargen/2007/9/7/enough-with-the-rainbow-tables-what-you-need-to-know-about-s.html
 *
 * How to use:
 * // hash password before storing it
 * $hashed = BCrypt::hash($password);
 *
 * // check password by comparing it to its hashed value
 * $check = BCrypt::verify($password, $hashed);
 *
 * // use a stronger salt (2 ^ 24 iterations)
 * $hashed = BCrypt::hash($password, BCrypt::salt(24));
 */
class BCrypt
{
    /**
     * @var integer number of iterations for salt generation (4..31)
     */
    const DEFAULT_ITERATION_COUNT = 10;

    /**
     * Hashes a password using PHP's `crypt()` function and a salt.
     * If no salt is provided, it will be generated using `salt()` method.
     *
     * @param string $password the password that will be hashed
     * @param string $salt the salt string to be used (optional)
     * @return string hashed password
     */
    public static function hash($password, $salt = null)
    {
        $salt = $salt ? : self::salt();
        return crypt($password, $salt);
    }

    /**
     * Generate cryptographically strong salt using Blowfish method.
     * The number of iterations must be in range 4..31 (default = 10).
     *
     * @see https://bugs.php.net/bug.php?id=55477
     * @param integer $iterations Base-2 logarithm of the iteration
     * @return string new generated salt
     */
    public static function salt($iterations = self::DEFAULT_ITERATION_COUNT)
    {
        $iterations = (int)$iterations;
        if ($iterations < 4 || $iterations > 31) {
            $iterations = self::DEFAULT_ITERATION_COUNT;
        }

        $mode = 0 <= version_compare(PHP_VERSION, '5.3.7') ? '$2y$' : '$2a$';
        $encoded = strtr(base64_encode(openssl_random_pseudo_bytes(16)), '+', '.');

        return sprintf('%s%02d$%s', $mode, $iterations, substr($encoded, 0, 22));
    }

    /**
     * Checks that given password and it's hash are equals.
     * Using constant-time algorithm to defend against timing attacks.
     *
     * @see http://codahale.com/a-lesson-in-timing-attacks
     * @param string $password raw password from user input
     * @param string $hash hashed password with which to compare
     * @return boolean true if password is valid
     */
    public static function verify($password, $hash)
    {
        $password = crypt($password, $hash);

        $result = 0;
        $length = strlen($password);
        if ($length === strlen($hash)) {
            // char at position $i need to be the same
            for ($i = 0; $i < $length; $i++) {
                $result |= $password[$i] !== $hash[$i];
            }
        }

        return $result === 0;
    }
}
