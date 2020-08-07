job "echo" {
  type = "service"
  datacenters = ["dc1", "dc2"]

  group "dev" {
    count = 2

    task "server" {
      driver = "docker"

      config {
        image = "jmalloc/echo-server"
        port_map = {
          http = 8080
        }
      }

      service {
        name = "web"
        port = "http"
        tags = ["dev", "server"]

        check {
          type = "tcp"
          port = "http"
          timeout = "2s"
          interval = "1s"
        }
      }

      resources {
        network {
          port "http" {}
        }
      }
    }
  }
}
