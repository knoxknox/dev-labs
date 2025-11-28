from pyspark import SparkContext

from settings import disable_info_logs
from queries.df.context import Context as DfContext
from queries.df.operations import Operations as DfOperations
from queries.rdd.context import Context as RddContext
from queries.rdd.operations import Operations as RddOperations

sc = SparkContext('local', 'Log analyzer')

disable_info_logs(sc)
data = sc.textFile('access.log')

# SQL
print("SQL example")
context = DfContext().current(sc, data)
operations = DfOperations(context)
operations.client_ips().show()
operations.top_endpoints().show()
operations.content_sizes().show()
operations.response_codes().show()

# RDD
print("RDD example")
context = RddContext().current(sc, data)
operations = RddOperations(context)
print(operations.client_ips())
print(operations.top_endpoints())
print(operations.response_codes())
print(operations.content_sizes().min())
print(operations.content_sizes().max())
print(operations.content_sizes().count())
