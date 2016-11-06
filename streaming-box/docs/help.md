## Hosts
```
localhost:2181 - zk
localhost:4040 - spark
localhost:9092 - kafka
localhost:9042 - cassandra
localhost:8080 - cassandra-web --bind 0.0.0.0:8080
localhost:8888 - java -jar trifecta.jar --http-start
```

## Services
```
$ ./cqlsh
$ ./cassandra -f
```
```
$ ./storm ui
$ ./storm nimbus
$ ./storm supervisor
```
```
$ ./pyspark
$ ./spark-submit demo.py
```
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
