# protocol

This project is based on the RESP protocol.<br/>
More info can be found on the official Redis site.

References:
- https://redis.io/topics/protocol
- https://github.com/antirez/RESP3/blob/master/spec.md

## communication

To send commands to server use `scripts/cli.sh` script.<br/>
This is simple TCP client to forward RESP commands to server.

Example:
```
$ ./scripts/cli.sh '*2\r\n$4\r\nPING\r\n$1\r\n1\r\n'

$ ./scripts/cli.sh '*2\r\n$3\r\nGET\r\n$3\r\nkey\r\n'
$ ./scripts/cli.sh '*3\r\n$3\r\nSET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n'

$ ./scripts/cli.sh '*2\r\n$4\r\nLLEN\r\n$3\r\nkey\r\n'
$ ./scripts/cli.sh '*2\r\n$4\r\nLPOP\r\n$3\r\nkey\r\n'
$ ./scripts/cli.sh '*2\r\n$4\r\nRPOP\r\n$3\r\nkey\r\n'
$ ./scripts/cli.sh '*2\r\n$6\r\nLRANGE\r\n$3\r\nkey\r\n'
$ ./scripts/cli.sh '*3\r\n$4\r\nLREM\r\n$3\r\nkey\r\n$1\r\n0\r\n'
$ ./scripts/cli.sh '*3\r\n$5\r\nLPUSH\r\n$3\r\nkey\r\n$6\r\nvalue1\r\n'
$ ./scripts/cli.sh '*3\r\n$5\r\nRPUSH\r\n$3\r\nkey\r\n$6\r\nvalue2\r\n'
$ ./scripts/cli.sh '*4\r\n$4\r\nLSET\r\n$3\r\nkey\r\n$1\r\n0\r\n$5\r\nvalue\r\n'

$ ./scripts/cli.sh '*3\r\n$4\r\nHGET\r\n$3\r\nkey\r\n$5\r\nfield\r\n'
$ ./scripts/cli.sh '*3\r\n$4\r\nHDEL\r\n$3\r\nkey\r\n$5\r\nfield\r\n'
$ ./scripts/cli.sh '*4\r\n$4\r\nHSET\r\n$3\r\nkey\r\n$5\r\nfield\r\n$5\r\nvalue\r\n'
```
