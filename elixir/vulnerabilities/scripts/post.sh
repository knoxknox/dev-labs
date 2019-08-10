#!/bin/bash

body='{"message": "pong"}'
echo $body | http post localhost:8080/message -j -v
