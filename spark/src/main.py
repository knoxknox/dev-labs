from pyspark import SparkContext
from settings import disable_info_logs

sc = SparkContext('local', 'Log analyzer')

disable_info_logs(sc)
data = sc.textFile('apache.log')

# SQL
print "SQL example"
from queries.df.context import *
from queries.df.operations import *
context = Context().current(sc, data)
operations = Operations(context)
operations.client_ips().show()
operations.top_endpoints().show()
operations.content_sizes().show()
operations.response_codes().show()

# RDD
print "RDD example"
from queries.rdd.context import *
from queries.rdd.operations import *
context = Context().current(sc, data)
operations = Operations(context)
print operations.client_ips()
print operations.top_endpoints()
print operations.response_codes()
print operations.content_sizes().min()
print operations.content_sizes().max()
print operations.content_sizes().count()
