user nginx;
worker_processes 1;

events {
  worker_connections 1024;
}

stream {
  upstream apps {
    server server9001:9001;
    server server9002:9002;
    server server9003:9003;
    server server9004:9004;
  }

  server {
    listen 80;
    proxy_pass apps;
  }
}
