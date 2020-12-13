user nginx;
worker_processes 1;

events {
  worker_connections 1024;
}

http {
  ##
  # Uses consistent hashing algorithm.
  # Default balancing method is round-robin.
  #
  upstream apps {
    ip_hash;
    server server9001:9001;
    server server9002:9002;
    server server9003:9003;
    server server9004:9004;
  }

  upstream app1 {
    server server9001:9001;
    server server9002:9002;
  }

  upstream app2 {
    server server9003:9003;
    server server9004:9004;
  }

  server {
    listen 80;
    listen 443 ssl http2;

    location / {
      return 403;
    }

    location /apps {
      proxy_pass http://apps/;
    }

    location /app1 {
      proxy_pass http://app1/;
    }

    location /app2 {
      proxy_pass http://app2/;
    }

    ssl_protocols TLSv1.3;
    ssl_certificate /etc/letsencrypt/demo/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/demo/privkey.pem;
  }
}
