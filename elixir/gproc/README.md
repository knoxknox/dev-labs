# gproc

Extended process communication.

To start development console locally:
```
$ make run
$
$ iex> App.start(:node1)
$ iex> App.start(:node2)
$ iex> App.create("JDoe")
$ iex> App.increment("JDoe", 10)
$ iex> App.increment("JDoe", 20)
$ iex> {:ok, 30} == App.balance(:node1, "JDoe")
$ iex> {:ok, 30} == App.balance(:node2, "JDoe")
$ iex>
$ iex> App.start(:node3)
$ iex> {:ok, 30} == App.balance(:node3, "JDoe")
```
