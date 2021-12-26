# kubernetes

Architecture:
```
+-Master Node---------------------+
| +------------+                  |
| |            | <--> etcd        |
| | API server | <--> scheduler   |<-- Developer
| |            | <--> controllers |
| +------------+                  |
+---------------------------------+

+-Worker Node---------------------+
| +-----+ +-----+     +---------+ |
| | Pod | | Pod |     | kubelet |-|--> API server
| +-----+ +-----+     +---------+ |
| +-----+          +------------+ |
| | Pod |          | kube-proxy |-|--> Worker Nodes network
| +-----+          +------------+ |
+---------------------------------+
```

Install k8s and k9s:
- run `brew install k9s` (https://k9scli.io);
- run `brew install kind` (https://kind.sigs.k8s.io);
