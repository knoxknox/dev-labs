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

Project contains: tests, netcat client, protocol specs, deployment docs.
