# kubernetes

```
+-Master Node---------------------+
| +------------+                  |
| |            | <--> etcd        |
| | API server | <--> scheduler   |<-- kubectl (kubeconfig)
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

## Setup

Install k8s and k9s:
- run `brew install k9s` (https://k9scli.io);
- run `brew install kind` (https://kind.sigs.k8s.io);

## Cluster

Manage cluster with next commands:
- run `kind create cluster --name dev` to create cluster;
- run `kind delete cluster --name dev` to delete cluster;
- run `kubectl cluster-info --context kind-dev` to view cluster;
