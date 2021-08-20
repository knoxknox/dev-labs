# dwe

Cheat Sheets for various Data Tools.

## Articles
- http://teamcoding.com/posts/2015-10-05-kafka
- http://dzone.com/articles/introduction-apache-cassandras
- http://knowm.org/how-to-install-a-distributed-apache-storm-cluster
- http://databricks.gitbooks.io/databricks-spark-reference-applications

## Packages
```
$ wget http://apache.ip-connect.vn.ua/kafka/2.8.0/kafka_2.13-2.8.0.tgz
$ wget http://apache.ip-connect.vn.ua/spark/spark-2.4.8/spark-2.4.8-bin-hadoop2.7.tgz
$ wget http://apache.ip-connect.vn.ua/storm/apache-storm-1.2.3/apache-storm-1.2.3.tar.gz
$ wget http://apache.ip-connect.vn.ua/cassandra/3.11.11/apache-cassandra-3.11.11-bin.tar.gz
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
$ ./spark-submit example.py
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
