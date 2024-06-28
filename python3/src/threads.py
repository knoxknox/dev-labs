import time
from queue import Queue
from threading import Thread

def producer(id, queue):
  for i in range(100):
    queue.put(i)
    time.sleep(0.1)
    print(f'Producer {id} send {i}')

def consumer(id, queue):
  while True:
    time.sleep(0.5)
    value = queue.get()
    print(f'Consumer {id} read {value}')
    queue.task_done() # current task is complete

if __name__ == '__main__':
  queue = Queue()

  producers = []
  for i in range(2):
    producers.append(Thread(target=producer, args=(i, queue), daemon=True))

  consumers = []
  for i in range(4):
    consumers.append(Thread(target=consumer, args=(i, queue), daemon=True))

  for thread in producers:
    thread.start()

  for thread in consumers:
    thread.start()

  queue.join()
  print('all tasks completed')
