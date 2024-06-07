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
