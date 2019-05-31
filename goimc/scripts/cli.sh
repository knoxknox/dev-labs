##
# Simple TCP client to send commands to server.
# Each command should be encoded by RESP specification.
#
# Example:
# sh scripts/cli.sh '*2\r\n$3\r\nGET\r\n$3\r\nkey\r\n'
# sh scripts/cli.sh '*3\r\n$3\r\nSET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n'
#
echo -n $1 | nc 0.0.0.0 6379 -v # $1 => command encoded in single quotes
