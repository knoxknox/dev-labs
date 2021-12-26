#!/bin/sh

docker-compose run --rm terraform -chdir=$1 ${@:2}
