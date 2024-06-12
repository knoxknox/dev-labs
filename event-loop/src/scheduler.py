import time
import heapq as pqueue
from collections import deque

class Scheduler:
    def __init__(self):
        self.tasks = deque()
        self.delayed_tasks = []

    def call_soon(self, task):
        self.tasks.append(task)

    def call_later(self, delay, task):
        deadline = time.time() + delay
        pqueue.heappush(self.delayed_tasks, (deadline, task))

    def run(self):
        while self.tasks or self.delayed_tasks:
            if not self.tasks:
                now = time.time()
                while self.delayed_tasks:
                    if self.delayed_tasks[0][0] > now:
                        break # deadline is not reached
                    else:
                        _, task = pqueue.heappop(self.delayed_tasks)
                        self.tasks.append(task) # move task to the queue

            while self.tasks:
                self.tasks.popleft()() # execute next task from the queue
