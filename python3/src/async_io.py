from datetime import datetime
from asyncio import get_event_loop

def delayed_task():
  print(datetime.now())
  loop.call_later(3, delayed_task)

loop = get_event_loop()

loop.call_soon(delayed_task)
loop.call_soon(delayed_task)
loop.call_soon(delayed_task)
loop.call_later(5, loop.stop)

loop.run_forever() # awaits stop event
