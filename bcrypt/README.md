php-bcrypt
==========

This lib allows you to hash the passwords via [bcrypt algorithm](http://en.wikipedia.org/wiki/Bcrypt).

**Why do you need to use it instead MD5, SHA1, SHA256, etc ?**<br/>
These are all general purpose hash functions, designed to calculate a digest of huge amounts of data in as short a time as possible.
<br/>
A modern server can calculate the MD5 hash of about 330MB every second.
If you’re willing to spend about $2,000 to your own CUDA cluster, it's let you try around 700,000,000 passwords a second.
And that rate you’ll be cracking those passwords at the rate of more than one per second.
It’s important to note that `salts are useless` for preventing dictionary attacks or brute force attacks.
It doesn’t affect how fast an attacker can try a candidate password, given the hash and the salt from your database.

**And how bcrypt solves these problems ?**<br/>
Basically, it’s slow as hell.
It uses a variant of the Blowfish encryption algorithm’s keying schedule, and introduces a work factor, which allows you to determine how expensive the hash function will be.
If we compare it with MD5, it will be slower 5 or so orders of magnitude.
Instead of cracking a password every N seconds, you need to cracking them every N years or so.
Your passwords might not need that kind of security and you might need a faster comparison algorithm, but bcrypt allows you to choose your balance of speed and security.

## Installation and Usage
Just add *BCrypt* class to your application.
Then anywhere in code, you can use password hashing and validation.
```php
// Hash password before storing it
$hashed = BCrypt::hash($password);

// Check password by comparing it to its hashed value
$check = BCrypt::verify($password, $hashed_password_value);

// Use a stronger salt (2 ^ 24 iterations)
$hashed = BCrypt::hash($password, BCrypt::salt(24));
```
