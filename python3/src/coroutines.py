import asyncio

##
# built-in: Awaitable, Coroutine
# asyncio abstractions: Future, Task
#
#      Awaitable
#     /         \
# Coroutine   Future
#                |
#               Task
#

async def fn(name):
  await asyncio.sleep(1)
  print(f'{name} after 1 sec sleep')

coroutine1 = fn('coroutine1')
coroutine2 = fn('coroutine2')

print(type(fn)) # <class 'function'>
print(type(coroutine1)) # <class 'coroutine'>
print(type(coroutine2)) # <class 'coroutine'>

asyncio.run(coroutine1) # coroutine1 after 1 sec sleep
asyncio.run(coroutine2) # coroutine2 after 1 sec sleep

##
# Run concurrently.
#
async def sleep1():
  await asyncio.sleep(1)
  print('after 1 sec sleep')

async def sleep5():
  await asyncio.sleep(5)
  print('after 5 sec sleep')

async def gather_sleep():
  await asyncio.gather(sleep1(), sleep5())

print('asyncio.gather')
asyncio.run(gather_sleep())

##
# Task and TaskGroup.
#
async def tasks():
  await asyncio.create_task(sleep1())
  await asyncio.create_task(sleep5())

asyncio.run(tasks()) # awaits tasks to complete

async def task_group():
  async with asyncio.TaskGroup() as group:
    group.create_task(sleep1())
    group.create_task(sleep5())

asyncio.run(task_group()) # awaits tasks to complete
