# openssh

OpenSSH cheat sheet.

```sh
# Forward Tunnel: remote to local
ssh -L 9000:localhost:8080 user@192.168.0.100

# Reverse Tunnel: local to remote
ssh -R 9000:localhost:9090 user@192.168.0.100
```

```sh
ssh -N -L 2300:localhost:23 user@192.168.0.100
localhost: $ telnet localhost 2300 - will connect to 192.168.0.100

ssh -f -N -R 2222:192.168.0.100:22 user@192.168.0.42
192.168.0.42: $ ssh -p2222 localhost - will connect to 192.168.0.100

ssh -f -N -L 8080:192.168.0.100:80 user@192.168.0.42
localhost: $ w3m -dump http://localhost:8080 - will connect to 192.168.0.100 (toward 192.168.0.42)
```
