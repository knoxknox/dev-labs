user nginx;
worker_processes 1;

events {
  worker_connections 1024;
}

http {
  server {
    listen 80;
    root /tmp/nginx;

    location /img {
      root /tmp/images;
    }

    location ~ .png$ {
      return 403;
    }
  }

  server {
    listen 8888;

    location / {
      proxy_pass http://localhost:80/;
    }

    location /img {
      proxy_pass http://localhost:80/img/;
    }
  }
}
