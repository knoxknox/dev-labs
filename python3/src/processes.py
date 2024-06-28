import os
import time
from multiprocessing import Process, JoinableQueue

def producer(id, queue):
  for i in range(100):
    queue.put(i)
    time.sleep(0.1)
    print(f'[pid={os.getpid()}] Producer {id} send {i}')
  queue.join() # blocks until all items have been processed

def consumer(id, queue):
  while True:
    time.sleep(0.5)
    value = queue.get()
    print(f'[pid={os.getpid()}] Consumer {id} read {value}')
    queue.task_done() # processing of the current task is complete

if __name__ == '__main__':
  cpus = os.cpu_count()
  queue = JoinableQueue()

  producers = []
  for i in range(2):
    producers.append(Process(target=producer, args=(i, queue)))

  consumers = []
  for i in range(cpus):
    consumers.append(Process(target=consumer, args=(i, queue), daemon=True))

  for process in producers:
    process.start()

  for process in consumers:
    process.start()

  for process in producers:
    process.join()
