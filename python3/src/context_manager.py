from contextlib import contextmanager

@contextmanager
def lock(target):
  print('acquire resource')
  try:
    yield f'return {target}'
  except:
    True # see more __exit__
  finally:
    print('release resource')

class Lock:
  def __init__(self, target):
    self.target = target

  def __enter__(self):
    print('acquire resource')
    return f'return {self.target}'

  def __exit__(self, klass, exception, traceback):
    print('release resource')
    if str(exception) == 'error happens':
      return True # prevents exception propagation

with lock('user#1') as result:
  print(result)
  raise Exception('error happens')

with Lock('user#2') as result:
  print(result)
  raise Exception('error happens')
