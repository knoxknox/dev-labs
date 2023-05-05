# rate-limiter

Usage:

Process 1 (1 req/sec with limit 2 req/sec)
```
$ ruby test/rate_limiter_test.rb

[2023-05-05 18:50:37] used 1 remaining 1 (overflow=false)
[2023-05-05 18:50:38] used 2 remaining 0 (overflow=true)
[2023-05-05 18:50:39] used 2 remaining 0 (overflow=true)
...
[2023-05-05 18:51:46] used 2 remaining 0 (overflow=true)
[2023-05-05 18:51:47] used 1 remaining 1 (overflow=false)
[2023-05-05 18:51:48] used 1 remaining 1 (overflow=false)
```

Process 2 (1 req/sec with limit 2 req/sec)
```
$ ruby test/rate_limiter_test.rb

[2023-05-05 18:50:38] used 1 remaining 1 (overflow=false)
[2023-05-05 18:50:39] used 1 remaining 1 (overflow=false)
[2023-05-05 18:50:40] used 1 remaining 1 (overflow=false)
...
[2023-05-05 18:51:12] used 2 remaining 0 (overflow=true)
[2023-05-05 18:51:13] used 2 remaining 0 (overflow=true)
[2023-05-05 18:51:14] used 2 remaining 0 (overflow=true)
...
[2023-05-05 18:51:25] used 1 remaining 1 (overflow=false)
[2023-05-05 18:51:26] used 1 remaining 1 (overflow=false)
[2023-05-05 18:51:27] used 1 remaining 1 (overflow=false)
```

Algorithms:
- https://systemsdesign.cloud/SystemDesign/RateLimiter
- https://vikas-kumar.medium.com/rate-limiting-techniques-245c3a5e9cad

Redis Scripting:
- https://redis.io/commands/eval/
- https://redis.io/commands/evalsha/
- https://redis.io/commands/script-flush/
- https://developer.redis.com/develop/java/spring/rate-limiting/fixed-window/reactive-lua/
