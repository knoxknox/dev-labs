#!/bin/bash

service docker start
consul agent -config-file=/etc/consul.d/config.json &

nomad agent -config=/etc/nomad.d
