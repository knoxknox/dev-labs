data_dir = "/tmp"

server {
  enabled = true
  bootstrap_expect = 3
}

autopilot {
  cleanup_dead_servers = true
  last_contact_threshold = "200ms"
  server_stabilization_time = "10s"
}
