# In-Memory cache

Implementation of Redis-like in-memory cache.

Features:
- KV storage with dicts, lists, strings
- TTL which can be used to expire per-key
- Operations: get, set, keys, update, remove
- Custom operations (get dict value, get i element on list, etc..)

Features (optional):
- auth
- performance tests
- persistence to db/disk
- scaling (client or server side)

Project contains: tests, format specs, telnet examples, deployment docs.

### Protocol

This project is based on RESP protocol.<br/>
More info can be found on official Redis site.

Features:
- https://redis.io/topics/protocol
- https://github.com/antirez/RESP3/blob/master/spec.md
