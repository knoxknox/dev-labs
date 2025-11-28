import re

from pyspark.sql import Row

from parser.log_entity import LogEntity

class LogParser:

  def __init__(self):
    pattern = self.pattern()
    self.regexp = re.compile(pattern)

  def parse(self, line):
    matcher = self.regexp.match(line)

    log_entity = LogEntity()
    log_entity.method(matcher.group(5))
    log_entity.user_id(matcher.group(3))
    log_entity.endpoint(matcher.group(6))
    log_entity.protocol(matcher.group(7))
    log_entity.client_ip(matcher.group(1))
    log_entity.request_time(matcher.group(4))
    log_entity.content_size(matcher.group(9))
    log_entity.response_code(matcher.group(8))
    log_entity.client_identity(matcher.group(2))

    return log_entity

  def parse_row(self, line):
    log_entity = self.parse(line)

    return Row(
      ip=log_entity.client_ip,
      method=log_entity.method,
      endpoint=log_entity.endpoint,
      content_size=int(log_entity.content_size),
      response_code=int(log_entity.response_code)
    )

  def pattern(self):
    return "^(\\S+) (\\S+) (\\S+) \\[([\\w:/]+\\s[+\\-]\\d{4})\\] \"(\\S+) (\\S+) (\\S+)\" (\\d{3}) (\\d+)"
