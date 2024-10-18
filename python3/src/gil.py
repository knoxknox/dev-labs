from threading import Lock, Thread
from urllib.request import urlopen as request

##
# Global Interpreter Lock:
#   - protects access to python objects
#   - prevents threads from executing bytecode at once
#
# Thread switching (option 1):
#   Thread 1 - running
#   Thread 2 - waiting (cv_wait for 0.005 sec)
#   Thread 2 - timeout, set gil_drop_request to 1
#   Interpreter - check gil_drop_request, drop gil
#   Interpreter - select next thread to run, take gil
#
# Thread switching (option 2):
#   Thread 1 - running
#   Thread 2 - waiting (cv_wait for 0.005 sec)
#   Thread 1 - send a network request (drop gil, send signal)
#   Thread 2 - receives signal, it has a chance to take the gil
#
# GIL release:
# - when syscall (sleep, disk i/o, network i/o)
# - when gil_drop_request is set by other thread give another thread a chance
#
# GIL structure:
# struct _gil_runtime_state {
#   unsigned long interval;       // time before setting gil_drop_request (0.005 sec)
#   PyThreadState* last_holder;   // address of the last PyThreadState holding the GIL
#   int locked;                   // whether gil is already taken (no = 0, yes = 1, uninitialized = -1)
#   unsigned long switch_number;  // number of gil switches since the beginning
#   PyCOND_T cond;                // condition variable used for signaling threads about release of gil
#   PyMUTEX_T mutex;              // mutex to protect _gil_runtime_state vars (locked, last_holder, switch_number)
#   PyCOND_T switch_cond;         // force switching: ensures that thread acquiring gil is not thread that released gil
#   PyMUTEX_T switch_mutex;       // force switching: ensures that thread acquiring gil is not thread that released gil
# }
#

class Counter:
  def __init__(self):
    self.counter = 0
    self.lock = Lock()

  def increment(self, name):
    with self.lock:
      self.counter += 1
      if name != 'T1' and name != 'T2':
        request('http://example.com').read()
      print(f'{name} send {self.counter}th request')

counter = Counter()
Thread(target=counter.increment, args=('T1',)).start() # w/o lock T1 => 1, with lock T1 => 1
Thread(target=counter.increment, args=('T2',)).start() # w/o lock T2 => 2, with lock T2 => 2
Thread(target=counter.increment, args=('T3',)).start() # w/o lock T3 => 5, with lock T3 => 3
Thread(target=counter.increment, args=('T4',)).start() # w/o lock T4 => 5, with lock T4 => 4
Thread(target=counter.increment, args=('T5',)).start() # w/o lock T5 => 5, with lock T5 => 5
