require 'configatron'

configatron.app.port = 8080
configatron.app.backlog_size = 8192

configatron.threadpool.size = 100
configatron.threadpool.maxsize = 200
configatron.threadpool.keepalive = 10
configatron.threadpool.max_queue_size = 100
