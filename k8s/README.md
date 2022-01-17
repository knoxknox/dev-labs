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
k8s terminology: https://www.youtube.com/watch?v=Ero82CCQIGk

## Setup

Install required tools:
- run `brew install k9s` (https://k9scli.io);
- run `brew install helm` (https://helm.sh/docs);
- run `brew install kind` (https://kind.sigs.k8s.io);

## Cluster

Manage cluster with next commands:
- run `kind create cluster --name dev` to create cluster;
- run `kind delete cluster --name dev` to delete cluster;
- run `kubectl cluster-info --context kind-dev` to view cluster;

## Deployments

Show resources:
- `kubectl get pods` to list pods;
- `kubectl get nodes` to list nodes;
- `kubectl get services` to list services;
- `kubectl get deployments` to list deployments;

Run deployment:
- `kubectl apply -f app/service.yaml` to start deployment;

Delete resources:
- `kubectl delete service {name}` to remove service by name;
- `kubectl delete deployment {name}` to remove deployment by name;

Describe resources:
- `kubectl describe {resource} {name}` where resource=pod,service,etc;

## Forwarding ports

```
$ kubectl get pods
> echo-deployment-65f58745f-98cvn   (Running)
> echo-deployment-65f58745f-t9j5p   (Running)
> echo-deployment-65f58745f-xkprd   (Running)

$ kubectl port-forward echo-deployment-65f58745f-98cvn 8000:9000
```
Then it's possible to use `curl 0.0.0.0:8000` to proxy requests to pod.

## Ingress controllers

```
$ kubectl apply -f app/ingress.yaml
$ kubectl apply -f app/service.yaml
```

To bootstrap ingress controller:
```
$ sh app/bin/ingress-nginx-controller.sh
$ sh app/bin/ingress-nginx-port-forward.sh
```

To validate that ingress controller works:
```
$ kubectl get ingress
$ kubectl describe ingress
$
$ curl localhost:8080/{path} => where {path} is /foo or /bar based on rules
```
