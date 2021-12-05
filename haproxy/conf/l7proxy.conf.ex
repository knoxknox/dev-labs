frontend _
  mode http
  bind *:80
  timeout client 10s
  default_backend apps

backend apps
  mode http
  timeout server 30s
  timeout connect 10s
  server server9001 server9001:9001
  server server9002 server9002:9002
  server server9003 server9003:9003
  server server9004 server9004:9004
