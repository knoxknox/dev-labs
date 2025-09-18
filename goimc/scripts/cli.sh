##
# Simple TCP client to send commands to server.
# Each command should be encoded by RESP specification.
#
# Example:
# ./scripts/cli.sh '*2\r\n$3\r\nGET\r\n$3\r\nkey\r\n'
# ./scripts/cli.sh '*3\r\n$3\r\nSET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n'
#
printf $1 | nc 0.0.0.0 6379 -v # $1 => command encoded in single quotes
