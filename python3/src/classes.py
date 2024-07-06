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
  __owner = 'Toyota'
  __headquarter = 'Japan'

  @classmethod
  def model(cls, arg):
    return f'Mazda model {arg}'

  def owner_details(self):
    return f'{self.__owner} ({self.__headquarter})'

##
# Specify custom metaclass.
# By default metaclass is `type`.
#
class Porsche(metaclass=Car):
  __owner = 'Porsche SE'
  __headquarter = 'Germany'

  @classmethod
  def model(cls, arg):
    return f'Porsche model {arg}'

  def owner_details(self):
    return f'{self.__owner} ({self.__headquarter})'

##
# Specify parent class.
# All methods are inherited from parent.
#
class PorscheBoxster(Porsche):
  @classmethod
  def model(cls, arg):
    return f'Porsche Boxster model {arg}'

  def owner_details(self):
    return f'Porsche Boxster {super().owner_details()}'

print(Car) # <class 'classes.Car'>
print(Mazda) # <class 'classes.Mazda'>
print(Porsche) # <class 'classes.Porsche'>
print(PorscheBoxster) # <class 'classes.PorscheBoxster'>

print(type(Car)) # <class 'type'>
print(type(Mazda)) # <class 'classes.Car'>
print(type(Porsche)) # <class 'classes.Car'>
print(type(PorscheBoxster)) # <class 'classes.Car'>

print(Mazda.model('CX-3')) # Mazda model CX-3
print(Porsche.model('911')) # Porsche model 911
print(PorscheBoxster.model('718S')) # Porsche Boxster model 718S

print(Mazda().owner_details()) # Toyota (Japan)
print(Porsche().owner_details()) # Porsche SE (Germany)
print(PorscheBoxster().owner_details()) # Porsche Boxster Porsche SE (Germany)

Mazda.unknown('Mazda', color='red') # method_missing ('Mazda',) {'color': 'red'}
Porsche.unknown('Porsche', color='green') # method_missing ('Porsche',) {'color': 'green'}
PorscheBoxster.unknown('PorscheBoxster', color='white') # method_missing ('PorscheBoxster',) {'color': 'white'}
