import time
import random

##
# Decorator:
# - allows to modify the functionality of a function by wrapping it in another function
# - multiple decorators can be applied by wrapping decorator's result into another decorator
#
# Next code is the same:
# > @decorator1
# > @decorator2
# > def decorated_function
#
# > decorator1(
# >   decorator2(
# >     decorated_function
# >   )
# > )('decorated function args')
#

def bold(function):
  def wrapper(*args, **kwargs):
    return f'<b>{function(*args, **kwargs)}</b>'
  return wrapper

def italic(function):
  def wrapper(*args, **kwargs):
    return f'<i>{function(*args, **kwargs)}</i>'
  return wrapper

def benchmark(function):
  def wrapper(*args, **kwargs):
    print(f'call {function.__name__}')
    print(f'function arguments={args}')

    start = time.time()
    result = function(*args, **kwargs)
    execution_time = time.time() - start

    print(f'result value is {result}')
    print(f'total time to run {execution_time:.8f}')

    return result
  return wrapper

@bold
def func1(arg):
  return f'func1 {arg}'

@italic
def func2(arg):
  return f'func2 {arg}'

@bold
@italic
def func3(arg):
  return f'func3 {arg}'

# manually
def func4(arg):
  return f'func4 {arg}'

@bold
@italic
@benchmark
def random_float(x, y):
  return random.uniform(x, y)

print(func1('test')) # <b>func1 test</b>
print(func2('test')) # <i>func2 test</i>
print(func3('test')) # <b><i>func3 test</i></b>
print(bold(func4)('test')) # <b>func4 test</b>
print(italic(func4)('test')) # <i>func4 test</i>
print(bold(italic(func4))('test')) # <b><i>func4 test</i></b>
print(random_float(100.0, 10000.0)) # <b><i>9092.0430906008</i></b>
