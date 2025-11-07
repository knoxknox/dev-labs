# cassandra

<p align="center">
  <img src="images/cassandra.png" />
</p>

# Commands

Start cluster with `dc start`.<br/>
Cassandra logs can be viewed with `dc logs`.

Run cqlsh console:
```
dc cassandra-cassandra-1 cqlsh
```

Create a keyspace:
```
CREATE KEYSPACE demo
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };
```

Create a test table:
```
CREATE TABLE demo.users (id int PRIMARY KEY, name text, updated_at timestamp);
```

Insert some test data:
```
INSERT INTO demo.users(id, name, updated_at) VALUES (1, 'Test User #1', toTimeStamp(now()));
INSERT INTO demo.users(id, name, updated_at) VALUES (2, 'Test User #2', toTimeStamp(now()));
INSERT INTO demo.users(id, name, updated_at) VALUES (3, 'Test User #3', toTimeStamp(now()));
INSERT INTO demo.users(id, name, updated_at) VALUES (4, 'Test User #4', toTimeStamp(now()));
INSERT INTO demo.users(id, name, updated_at) VALUES (5, 'Test User #5', toTimeStamp(now()));
```

Run `SELECT * FROM demo.users WHERE id IN (1, 2, 3);` to select first three users from database.

## References
- https://cassandra.apache.org/doc/4.0/cassandra/cql
- http://dzone.com/articles/introduction-apache-cassandras
