# replication

Process events replication.

To start development console locally:
```
$ make run
$
$ iex> Master.start()
$ iex> Replica.start(:replica1)
$ iex> Replica.start(:replica2)
$ iex>
$ iex> Master.create("JDoe")
$ iex> Master.increment("JDoe", 25)
$ iex> Master.increment("JDoe", 25)
$ iex>
$ iex> {:ok, 50} = Master.balance("JDoe")
$ iex> {:ok, 50} = Replica.balance(:replica1, "JDoe")
$ iex> {:ok, 50} = Replica.balance(:replica2, "JDoe")
```
