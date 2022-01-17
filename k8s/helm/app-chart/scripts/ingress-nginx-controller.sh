#!/bin/sh

helm install \
  ingress-nginx \
  ingress-nginx \
  --create-namespace \
  --namespace ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx
