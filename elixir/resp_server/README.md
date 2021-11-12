# resp-server

TCP server based on RESP protocol.

To start development server locally:
```
$ make run
$
$ iex> RespServer.Redix.send(["TEST"])
$ iex> RespServer.Redix.send(["TEST", 42])
```
