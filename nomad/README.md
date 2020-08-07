# nomad

This project contains:
- nomad server cluster;
- consul server cluster;
- consul clients on nomad servers and nodes;
- service registration and discovery via consul;
- two nodes with agents connected to nomad and consul;

Nomad cluster expects 3 instances (1 server and 2 followers).<br/>
This is required by design to have the minimum quorum for leader election.

# Commands

Run cluster with `dc start`.<br/>
Visit http://localhost:4646/ui for the UI.

$ dc ls
```
nomad_nomad-server_1         0.0.0.0:4646->4646/tcp, 4647/tcp, 4648/tcp
nomad_nomad-follower-1_1     4647/tcp
nomad_nomad-follower-2_1     4648/tcp
nomad_nomad-client-dc1_1
nomad_nomad-client-dc2_1
nomad_consul-server_1        8300/tcp, 8301/tcp/udp, 8302/tcp/udp, 8500/tcp, 8600/tcp/udp
```

To check apps versions:
```
$ dc nomad_nomad-client-dc1_1
$
$ nomad version    => Nomad v0.12.1
$ consul version   => Consul v1.8.1
$ docker version   => Docker 19.03.12
```

To schedule a new job to the nomad cluster:
```
$ nomad plan jobs/echo.nomad
$ nomad job run -check-index <INDEX> jobs/echo.nomad
```

To check if the job/task in running in the cluster:
```
$ nomad status
~
> ID    Type     Priority  Status   Submit Date
> echo  service  50        running  2020-08-07T10:31:52Z
```

To check allocations details and get allocation ip/port:
```
$ nomad job status echo
~
> Allocations
> ID        Node ID   Task Group  Version  Desired  Status
> 122e097d  f5687f0e  dev         0        run      running
> f8b9e388  2d6ab7e8  dev         0        run      running
```
```
$ nomad alloc status 122e097d
~
> Task Resources
> CPU        Memory           Disk     Addresses
> 2/100 MHz  1.5 MiB/300 MiB  300 MiB  http: 172.19.0.5:31679
```
```
$ nomad alloc status f8b9e388
~
> Task Resources
> CPU        Memory           Disk     Addresses
> 2/100 MHz  1.4 MiB/300 MiB  300 MiB  http: 172.19.0.7:27926
```

To access each allocation (122e097d/f8b9e388) use curl command:
```
$ curl 172.19.0.5:31679   => 200: Request served by e6d5be866435
$ curl 172.19.0.7:27926   => 200: Request served by 5a014dbffd5c
```
