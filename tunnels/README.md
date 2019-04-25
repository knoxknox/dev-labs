# openssh

OpenSSH cheat sheet.

```sh
# Forward Tunnel
# remote port 8080 to local port 9000
ssh -L 9000:localhost:8080 user@192.168.0.100

# Reverse Tunnel
# local port 9000 to remote port 9090
ssh -R 9000:localhost:9090 user@192.168.0.100
```

```sh
# 127.0.0.1:2300 <-> 192.168.0.100:23
ssh -f -N -L 2300:localhost:23 user@192.168.0.100
localhost: $ nc 127.0.0.1 2300 - will connect to 192.168.0.100

# 192.168.0.42:2222 <-> 192.168.0.100:22
ssh -f -N -R 2222:192.168.0.100:22 user@192.168.0.42
192.168.0.42: $ ssh -p2222 localhost - will connect to 192.168.0.100

# 127.0.0.1:8080 <-> 192.168.0.42:8080 <-> 192.168.0.100:80
ssh -f -N -L 8080:192.168.0.100:80 user@192.168.0.42
localhost: $ nc 127.0.0.1 8080 - connect to 192.168.0.100 toward 192.168.0.42
```
