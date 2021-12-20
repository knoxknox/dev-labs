static_resources:
  clusters:
    - name: apps
      type: strict_dns
      connect_timeout: 1s
      lb_policy: round_robin
      load_assignment:
        cluster_name: apps
        endpoints:
          - lb_endpoints:
            - endpoint:
                address:
                  socket_address:
                    port_value: 9001
                    address: server9001
            - endpoint:
                address:
                  socket_address:
                    port_value: 9002
                    address: server9002
            - endpoint:
                address:
                  socket_address:
                    port_value: 9003
                    address: server9003
            - endpoint:
                address:
                  socket_address:
                    port_value: 9004
                    address: server9004
  listeners:
    - address:
        socket_address:
          address: 0.0.0.0
          port_value: 10000
      filter_chains:
        - filters:
          - name: envoy.filters.network.http_connection_manager
            typed_config:
              '@type': 'type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager'
              stat_prefix: http_proxy
              http_filters:
                - name: envoy.filters.http.router
              route_config:
                name: router
                virtual_hosts:
                  - name: apps
                    domains:
                      - '*'
                    routes:
                      - match: { prefix: '/' }
                        route:
                          cluster: apps
