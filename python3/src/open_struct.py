from collections import namedtuple

def OpenStruct(**kwargs):
  field_names = ' '.join(kwargs.keys())
  return namedtuple('OpenStruct', field_names)(**kwargs)

print(OpenStruct(name='John')) # # OpenStruct(name='John')
print(OpenStruct(name='Jason', age=30)) # # OpenStruct(name='Jason', age=30)
