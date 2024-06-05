import inspect
import traceback

from queue import Queue

def add(array, value):
  return insert(array, 0, value)

def insert(array, index, value):
  traceback.print_stack()
  return array.insert(index, value)

class BaseQueue(Queue): pass
class BlockingQueue(BaseQueue): pass
class ArrayBlockingQueue(BlockingQueue): pass
class LinkedBlockingQueue(BlockingQueue): pass

add([], 42) # object caller
print(id(insert)) # object id
print(dir(BaseQueue)) # object methods
print(ArrayBlockingQueue.mro()) # object ancestors
print(inspect.getsource(Queue)) # object source code
print(inspect.getsourcefile(Queue)) # object source location
