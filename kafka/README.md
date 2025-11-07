# kafka

<p align="center">
  <img src="images/kafka.png" />
</p>

```
$ cd kafka/bin
$ ./zookeeper-server-start.sh ../config/zookeeper.properties
```
```
$ ./kafka-topics.sh --list --zookeeper localhost:2181
$ ./kafka-server-start.sh /kafka/config/server.properties
$
$ ./kafka-console-producer.sh --topic demo --broker localhost:9092
$ ./kafka-console-consumer.sh --topic demo --zookeeper localhost:2181
$ ./kafka-topics.sh --create --zookeeper localhost:2181 --topic demo --partitions 1 --replication-factor 1
$
$ ./kafka-console-producer.sh --topic demo --broker localhost:9092 --new-producer
$ ./kafka-console-consumer.sh --topic demo --zookeeper localhost:2181 --consumer.config=consumer1.conf
$ ./kafka-console-consumer.sh --topic demo --zookeeper localhost:2181 --consumer.config=consumer2.conf
$ ./kafka-topics.sh --create --zookeeper localhost:2181 --topic demo --partitions 2 --replication-factor 1
```
