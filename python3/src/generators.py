##
# Generator is a function that returns an iterator using yield keyword.
# They contains `__iter__` and `__next__` methods which holds its present state.
#
# A generator may iterate over a collection but return the items decorated in some way.
# A generator implements the iterator interface but may produces items not in a collection.
#

def generator(limit):
  index = 0
  while index < limit:
    index += 1
    yield index

for i in generator(1_000_000_000): print(i)

##
# Generator can also receive values, they support bi-directional communication.
# The `yield` keyword can also receive values, a generator becomes a listener in such case.
#

def coroutine():
  result = ''
  while True:
    input = yield result
    result = input.upper()

  return result

generator = coroutine()

next(generator) # init generator
print(generator.send('test1')) # TEST1
print(generator.send('test2')) # TEST2
generator.close() # clean itself up and exit
