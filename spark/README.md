# spark

Single-mode
```
$ ./pyspark
$ ./spark-submit main.py
```

Cluster-mode
```
$ ./spark/sbin/start-master.sh
$ ./spark/sbin/start-slave.sh spark://dvnull-spark:7077
$ ./spark/bin/spark-submit main.py --master spark://dvnull-spark:7077
```

Example of Job
```
sc = SparkContext('spark://dvnull-spark:7077', 'App')

# 100812, Joe, 55
# 100818, Moe, 45
# 100819, Moe, 35
schema = StructType([
  StructField('id', IntegerType()),
  StructField('name', StringType()),
  StructField('count', IntegerType())
])

sql_context = SQLContext(sc)
df = sql_context.read.csv('users.csv', schema=schema, header=False)

df.registerTempTable('users')
result = sql_context.sql('SELECT * FROM users WHERE count > 40')
df.filter(df['count'] > 30).write.csv('/home/example/workspace/gt30/')
result.coalesce(1).write.mode('append').csv('/home/example/workspace/gt40/')
```

Resources:
- https://databricks.gitbooks.io/databricks-spark-reference-applications
- https://developerzen.com/best-practices-writing-production-grade-pyspark-jobs-cb688ac4d20f
