from collections import namedtuple

def OpenStruct(**kwargs):
  return namedtuple('OpenStruct', ' '.join(kwargs.keys()))(**kwargs)

print(OpenStruct(name='John')) # # OpenStruct(name='John')
print(OpenStruct(name='Jason', age=30)) # # OpenStruct(name='Jason', age=30)
