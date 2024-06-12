# event-loop

Basic event loop implementation.

```python
import sys
import logging

logger = logging.getLogger(__name__)
logging.basicConfig(format='%(asctime)s %(message)s')

scheduler = Scheduler()
scheduler.call_soon(lambda: logger.warning('task_1')) # # 19:00:00 task_1
scheduler.call_soon(lambda: logger.warning('task_2')) # # 19:00:00 task_2
scheduler.call_later(0, lambda: logger.warning('task_3')) # # 19:00:00 task_3
scheduler.call_later(5, lambda: logger.warning('task_4')) # # 19:00:05 task_4
scheduler.run() # run event loop and executes tasks and delayed tasks in the loop
```
