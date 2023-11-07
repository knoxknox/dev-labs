#!/bin/bash

name="user-$RANDOM"
email="$name@example.com"

curl -X POST \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data-raw '{"name": "'$name'", "email": "'$email'"}' \
  '0.0.0.0:8080/users'
