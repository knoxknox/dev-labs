from classes import Mazda

def model_mock(self, _):
  print('mazda model mock version')

mazda = Mazda()
mazda.model('original') # mazda model original

Mazda.model = model_mock
mazda_new_instance = Mazda()
mazda_new_instance.model('test') # mazda model mock version
