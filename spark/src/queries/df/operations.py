class Operations:

  def __init__(self, context):
    self.context = context

  def client_ips(self):
    return self.context.sql("SELECT ip, COUNT(*) AS total FROM logs GROUP BY ip HAVING total > 3 LIMIT 10")

  def top_endpoints(self):
    return self.context.sql("SELECT endpoint, COUNT(*) as total FROM logs GROUP BY endpoint ORDER BY total DESC LIMIT 10")

  def content_sizes(self):
    return self.context.sql("SELECT SUM(content_size), COUNT(*), MIN(content_size), MAX(content_size) FROM logs")

  def response_codes(self):
    return self.context.sql("SELECT response_code, COUNT(*) FROM logs GROUP BY response_code LIMIT 100")
