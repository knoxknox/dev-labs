##
# Simple TCP client to send commands to server.
# Each command should be encoded by RESP specification.
#
echo -n $1 | nc 0.0.0.0 6379 -v # $1 => '*2\r\n$3\r\nGET\r\n$3\r\nkey\r\n'
