#!/bin/bash

curl -X PUT \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data-raw '{"name": "updated-order-'$RANDOM'"}' \
  0.0.0.0:8080/orders/$1
