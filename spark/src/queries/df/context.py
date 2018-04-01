from parser.log_parser import *
from pyspark.sql import SQLContext
from pyspark.sql.types import StructType, StructField
from pyspark.sql.types import DoubleType, IntegerType, StringType

class Context:

  def current(self, sc, data):
    parser = LogParser()
    sql_context = SQLContext(sc)
    schema = StructType([
      StructField('ip', StringType()),
      StructField('endpoint', StringType()),
      StructField('content_size', IntegerType()),
      StructField('response_code', IntegerType())
    ])
    df = data.map(lambda row: parser.parse_row(row))
    data_frame = sql_context.createDataFrame(df, schema=schema)
    data_frame.registerTempTable('logs')
    return sql_context
