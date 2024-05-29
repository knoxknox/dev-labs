def simple(arg):
  return f'simple function {arg}'

def conditional(arg):
  if arg == 1:
    def nested(arg):
      return f'conditional function {arg}'
  else:
    def nested(arg):
      return f'conditional function {arg}'
  return nested

def nested_class(arg):
  class NestedClass:
    def __init__(self):
      self.arg = arg
    def output(self, arg):
      print('output', self.arg, arg)
  return NestedClass

print(simple(42)) # simple function 42

print(conditional(1)(1)) # conditional function 1
print(conditional(2)(2)) # conditional function 2

result = nested_class(42) # <class 'NestedClass'>
result().output('additional arg') # output 42 additional arg
