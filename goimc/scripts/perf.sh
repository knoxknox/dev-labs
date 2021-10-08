##
# Performance testing script (50 clients, 100K requests).
#
redis-benchmark -h 0.0.0.0 -p 6379 -t GET,SET -c 50 -n 100000
