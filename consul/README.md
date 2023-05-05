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

$ dc consul-consul-server-1 consul members
```
Node          Address          Status  Type    Build  Protocol  DC   Segment
dc838d795391  172.18.0.6:8301  alive   server  1.8.0  2         dc1  <all>
5d7033a46f4c  172.18.0.3:8301  alive   client  1.8.0  2         dc1  <default>
b66ea3b73a40  172.18.0.5:8301  alive   client  1.8.0  2         dc1  <default>
```

$ dig @127.0.0.1 -p 8600 example.service.consul
```
;; ANSWER SECTION:
example.service.consul. 0 IN  A 127.0.0.1
```

$ dig @127.0.0.1 -p 8600 example.service.consul SRV
```
;; ANSWER SECTION:
example.service.consul. 0 IN  SRV 1 1 4002 7f000001.addr.dc1.consul.
example.service.consul. 0 IN  SRV 1 1 4001 7f000001.addr.dc1.consul.

;; ADDITIONAL SECTION:
7f000001.addr.dc1.consul. 0 IN  A 127.0.0.1
b66ea3b73a40.node.dc1.consul. 0 IN  TXT "consul-network-segment="
7f000001.addr.dc1.consul. 0 IN  A 127.0.0.1
5d7033a46f4c.node.dc1.consul. 0 IN  TXT "consul-network-segment="
```

Service info can be fetched via HTTP: `curl http://localhost:8500/v1/catalog/service/example`.
