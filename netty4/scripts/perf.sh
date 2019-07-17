#!/bin/bash

# 50 threads, 50 connections, 30s test
wrk -t50 -c50 -d30s http://127.0.0.1:8080/health
