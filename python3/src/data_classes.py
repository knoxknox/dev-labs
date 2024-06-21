from dataclasses import dataclass

@dataclass
class Car:
  model: str
  seats: int

@dataclass
class Mazda(Car):
  color: str

@dataclass
class Porsche(Car):
  color: str

print(Car('Spider', 2)) # # Car(model='Spider', seats=2)
print(Mazda('CX-3', 4, 'red')) # # Mazda(model='CX-3', seats=4, color='red')
print(Porsche('911', 4, 'white')) # # Porsche(model='911', seats=4, color='white')
