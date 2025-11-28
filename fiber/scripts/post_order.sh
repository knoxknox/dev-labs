#!/bin/bash

curl -X POST \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data-raw '{"name": "test-order-'$RANDOM'"}' \
  0.0.0.0:8080/orders
