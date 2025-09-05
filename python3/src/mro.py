class A0:
  def test():
    print('A0#test')

class A1(A0):
  def test():
    print('A1#test')

class A2(A1):
  def test():
    print('A2#test')

class B0:
  def test():
    print('B0#test')

class B1(B0):
  def test():
    print('B1#test')

class B2(B1):
  def test():
    print('B2#test')

class C0(A2, B2):
  def test():
    print('C0#test')

print(C0.mro()) # [C0, A2, A1, A0, B2, B1, B0, object]
