from queue import Queue as BaseQueue

##
# Monkey patching base classes.
#
class Queue(BaseQueue):
  def __add__(self, value):
    self.put(value)
  def __repr__(self):
    result = []
    while not self.empty():
      result.append(self.get())
    return ','.join(map(str, result))

queue = Queue()
queue + 1 # calls __add__
queue + 2 # calls __add__
print(queue) # calls __repr__ => 1,2

##
# Magic methods.
# https://docs.python.org/3/reference/datamodel.html
#
class Person:
  def __init__(self, name):
    self.name = name
  def __len__(self):
    return len(self.name)
  def __repr__(self):
    return f'Person: {self.name}'
  def __call__(self, arg):
    print('Called with arg', arg)
  def __mul__(self, times):
    if type(times) is int:
      self.name = self.name * times
      return self
    raise TypeError('incorrect type, should be int')

jdoe = Person('jdoe')
jdoe(42) # calls __call__
print(jdoe) # calls __repr__
print(len(jdoe)) # calls __len__
print(jdoe * 3) # calls __repr__(__mul__)
