##
# Base metaclass for cars.
# Inherits from `type` metaclass.
#
class Car(type):
  def __getattr__(self, name):
    def method_missing(*args, **kwargs):
      print('method_missing', args, kwargs)
    return method_missing

##
# Specify custom metaclass.
# By default metaclass is `type`.
#
class Mazda(metaclass=Car):
  @classmethod
  def model(cls, arg):
    print('mazda model', arg)

##
# Specify custom metaclass.
# By default metaclass is `type`.
#
class Porsche(metaclass=Car):
  @classmethod
  def model(cls, arg):
    print('porsche model', arg)

##
# Specify parent class.
# All methods are inherited from parent.
#
class PorscheBoxster(Porsche):
  @classmethod
  def model(cls, arg):
    print('porsche boxster model', arg)

print(Car) # <class 'classes.Car'>
print(Mazda) # <class 'classes.Mazda'>
print(Porsche) # <class 'classes.Porsche'>
print(PorscheBoxster) # <class 'classes.PorscheBoxster'>

print(type(Car)) # <class 'type'>
print(type(Mazda)) # <class 'classes.Car'>
print(type(Porsche)) # <class 'classes.Car'>
print(type(PorscheBoxster)) # <class 'classes.Car'>

Mazda.model('CX-3') # mazda model CX-3
Porsche.model('911') # porsche model 911
PorscheBoxster.model('718S') # porsche boxster model 718S

Mazda.unknown('Mazda', color='red') # method_missing ('Mazda',) {'color': 'red'}
Porsche.unknown('Porsche', color='green') # method_missing ('Porsche',) {'color': 'green'}
PorscheBoxster.unknown('PorscheBoxster', color='white') # method_missing ('PorscheBoxster',) {'color': 'white'}
