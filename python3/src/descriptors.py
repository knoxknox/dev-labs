from abc import ABC, abstractmethod

##
# Descriptor:
# - attribute value that has one of the methods from the descriptor protocol
# - descriptor protocol should define any of: __get__(), __set__() or __delete__()
#

class Validator(ABC):
  @abstractmethod
  def validate(self, value):
    pass

  def __set_name__(self, owner, name):
    self.attribute = name
    self.private_name = f'__{name}'

  def __get__(self, obj, objtype=None):
    return getattr(obj, self.private_name)

  def __set__(self, obj, value):
    self.validate(value)
    setattr(obj, self.private_name, value)

class NumberValidator(Validator):
  def __init__(self, min=None, max=None):
    self.min = min
    self.max = max

  def validate(self, value):
    if not isinstance(value, (int, float)):
      raise TypeError(f'Value "{self.attribute}" is not int or float')
    if self.min is not None and value < self.min:
      raise ValueError(f'Validation failed "{self.attribute}" min value is {self.min}')
    if self.max is not None and value > self.max:
      raise ValueError(f'Validation failed "{self.attribute}" max value is {self.max}')

class StringValidator(Validator):
  def __init__(self, min=None, max=None):
    self.min = min
    self.max = max

  def validate(self, value):
    if not isinstance(value, str):
      raise TypeError(f'Value "{self.attribute}" is not a string')
    if self.min is not None and len(value) < self.min:
      raise ValueError(f'Validation failed "{self.attribute}" min length is {self.min}')
    if self.max is not None and len(value) > self.max:
      raise ValueError(f'Validation failed "{self.attribute}" max length is {self.max}')

class Example:
  age = NumberValidator(min=18, max=60)
  name = StringValidator(min=10, max=30)

  def __init__(self, age, name):
    self.age = age
    self.name = name

Example(18, 'test')
Example(None, None) # Value "age" is not int or float
Example(1, None) # Validation failed "age" min value is 18
Example(90, None) # Validation failed "age" max value is 60
Example(18, None) # Value "name" is not a string
Example(18, 'x') # Validation failed "name" min length is 10
Example(18, 'x' * 100) # Validation failed "name" max length is 30
