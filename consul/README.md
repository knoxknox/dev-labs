# consul

This project contains:
- consul server (single node);
- two consul services (ruby apps);
- two consul agents, one per service;

Consul agents are tied to a specific host.<br/>
One agent should be run per host and can handle multiple app containers.<br/>
In this app we assume that we have 3 hosts: 1 = server, 1 = agent+service, 1 = agent+service.

# Commands

Run cluster with `dc start`.<br/>
Visit http://localhost:8500 for the UI.

```
> dc consul_consul-main_1 consul members

Node          Address          Status  Type    Build  Protocol  DC   Segment
73200469b3c9  172.18.0.6:8301  alive   server  1.8.0  2         dc1  <all>
4b951c3b9095  172.18.0.4:8301  alive   client  1.8.0  2         dc1  <default>
62f7da7ed5d6  172.18.0.3:8301  alive   client  1.8.0  2         dc1  <default>
```

Fetch service info from consul:
- dig @127.0.0.1 -p 8600 example.service.consul
- dig @127.0.0.1 -p 8600 example.service.consul SRV
- curl http://localhost:8500/v1/catalog/service/example
