class Operations:

  def __init__(self, context):
    self.context = context

  def client_ips(self):
    return self.context.map(lambda log: (log.client_ip, 1)).reduceByKey(lambda a, b: a + b).filter(lambda x: x[1] > 3).map(lambda x: x[0]).take(10)

  def top_endpoints(self):
    return self.context.map(lambda log: (log.endpoint, 1)).reduceByKey(lambda a, b: a + b).takeOrdered(10, key = lambda x: -x[1])

  def content_sizes(self):
    return self.context.map(lambda x: x.content_size).cache()

  def response_codes(self):
    return self.context.map(lambda log: (log.response_code, 1)).reduceByKey(lambda a, b: a + b).take(100)
