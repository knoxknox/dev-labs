from parser.log_parser import *

class Context:

  def current(self, sc, data):
    parser = LogParser()
    return data.map(lambda row: parser.parse(row)).cache()
