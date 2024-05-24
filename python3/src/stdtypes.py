##
# Documentation:
# https://docs.python.org/3/library/stdtypes.html
#
class CustomClass: pass
def custom_function(): pass

def print_types():
  print(type(None))            # <class 'NoneType'>
  print(type(True))            # <class 'bool'>
  print(type(False))           # <class 'bool'>
  print(type('str'))           # <class 'str'>
  print(type(b'bytes'))        # <class 'bytes'>
  print(type(42))              # <class 'int'>
  print(type(42.5))            # <class 'float'>
  print(type(complex(42)))     # <class 'complex'>
  print(type([]))              # <class 'list'>
  print(type(()))              # <class 'tuple'>
  print(type({}))              # <class 'dict'>
  print(type({1, 2, 3}))       # <class 'set'>
  print(type(range(1, 10)))    # <class 'range'>
  print(type(CustomClass))     # <class 'type'>
  print(type(custom_function)) # <class 'function'>
