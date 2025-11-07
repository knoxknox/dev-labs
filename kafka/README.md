# kafka

<p align="center">
  <img src="images/kafka.png" />
</p>

# Commands

Run kafka with `dc start`.<br/>
Open a shell with `dc kafka-kafka-1`.

List topics:
```
$ ./kafka-topics.sh --bootstrap-server localhost:9092 --list
```

Delete a topic:
```
$ ./kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic test-topic
```

Create a topic
```
$ ./kafka-topics.sh --bootstrap-server localhost:9092 --create --topic test-topic --partitions 1 --replication-factor 1
```

Start a consumer:
```
$ ./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test-topic
```

Start a producer:
```
$ ./kafka-console-producer.sh --bootstrap-server localhost:9092 --topic test-topic
```
