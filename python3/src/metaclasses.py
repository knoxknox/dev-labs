class Car:
  def model(self):
    return 'Spyder 918'

print(type(Car)) # <class 'type'>
print(Car().model()) # Spyder 918
print(Car.__class__) # <class 'type'>
print(isinstance(Car, object)) # True

def model(self):
  return 'Spyder 918'

# type(name, bases, attributes)
# fill class __name__, __bases__, __dict__
# Car is an object (not a class), metaclass creates an instance of Car
Porsche = type('Porsche', (object,), {'model': model, 'color': 'white'})

print(type(Porsche)) # <class 'type'>
print(Porsche().model()) # Spyder 918
print(Porsche.__class__) # <class 'type'>
print(isinstance(Porsche, object)) # True

##
# Custom metaclass definition.
#
class utype(type):
  @classmethod
  def __prepare__(meta, name, bases):
    print('Prepare class', name, bases)
    return super().__prepare__(name, bases)

  @staticmethod
  def __new__(meta, name, bases, attributes):
    print('Creates an object', name, bases, attributes)
    return super().__new__(meta, name, bases, attributes)

  def __init__(cls, name, bases, attributes):
    print('Init', name, bases, attributes)
    super().__init__(name, bases, attributes)

  def __call__(cls, *args, **kwargs):
    print('Create a new instance', cls)
    return super().__call__(*args, **kwargs)

class Queue(metaclass=utype):
  def queue_method(self): pass

class DoubleLinkedListQueue(Queue):
  def double_linked_list_method1(self): pass
  def double_linked_list_method2(self): pass

queue = DoubleLinkedListQueue()

print(queue.__class__) # <class 'DoubleLinkedListQueue'>
print(type(DoubleLinkedListQueue)) # <class 'metaclasses.utype'>
print(DoubleLinkedListQueue.__bases__) # <class 'metaclasses.Queue'>
print(DoubleLinkedListQueue.__mro__) # <class 'DoubleLinkedListQueue'>, <class 'Queue'>, <class 'object'>
