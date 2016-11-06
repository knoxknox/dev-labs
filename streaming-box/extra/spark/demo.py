from pyspark import SparkContext

sc = SparkContext('local', 'App')
data = sc.textFile('demo.txt').cache()

chars = data.filter(lambda x: 'a' in x).count()
print('Count of chars in demo file: %i' % (chars))
