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
