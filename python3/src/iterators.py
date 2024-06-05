##
# Iterable:
#   - supports iteration protocol (__iter__)
#   - supports sequence protocol (__getitem__)
#   - anything that you can loop over with the help of loops
#   - objects like: lists, files, tuples, ranges, strings, dictionaries, etc..
# Iterator:
#   - supports iterator protocol (__next__)
#   - returns one element at a time from iterable
#   - function `iter` can be used to convert an iterable into an iterator class
#
# How loop works:
# > array = [1, 2, 3]
# > for number in array: print(number)
#
# This code converts under the hood to:
# > iterator = iter(array)
# > while True:
# >   try:
# >     print(iterator.__next__())
# >   except StopIteration:
# >     break # no more elements to iterate
#

# numbers = [i for i in range(1_000_000_000)]
# for i in numbers: print(i) # produces ~40GB of memory

class CharIterator:
  def __init__(self, values):
    self.values = values

  def __iter__(self):
    self.i = 0
    return self

  def __next__(self):
    self.i += 1
    if self.i > len(self.values):
      raise StopIteration
    return self.values[self.i - 1]

for char in CharIterator(['a', 'b', 'c', 'd']):
  print(f"next character in iteration is {char}")
