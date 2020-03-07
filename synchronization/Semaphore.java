package edu.Synchronization;

import java.util.Queue;
import java.util.ArrayDeque;
import java.util.concurrent.TimeoutException;

public class Semaphore {
  final static long MAX_SLEEP = Long.MAX_VALUE;

  int count; // integer count for this semaphore
  SpinLock guard; // spin lock that guards p and v methods
  Queue<Thread> sleepingThreads; // a queue of sleeping threads

  public Semaphore(int initialCount) {
    count = initialCount;
    guard = new SpinLock();
    sleepingThreads = new ArrayDeque<Thread>();
  }

  public void p() {
    guard.acquire();

    if (count == 0) {
      sleepingThreads.add(Thread.currentThread());
      guard.release();

      try {
        Thread.sleep(MAX_SLEEP);
      }
      catch (InterruptedException e) {
        // resume execution when interrupted
      }
    }
    else {
      count--;
      guard.release();
    }
  }

  public void v() {
    guard.acquire();

    if (sleepingThreads.isEmpty()) {
      count++;
      guard.release();
    }
    else {
      Thread next = sleepingThreads.remove();
      guard.release();
      next.interrupt();
    }
  }

  public void p(int timeoutInMs) throws TimeoutException {
    guard.acquireWithTimeout(timeoutInMs);
    long startTimeInMs = System.currentTimeMillis();

    if (count == 0) {
      sleepingThreads.add(Thread.currentThread());
      guard.release();

      try {
        long elapsedTimeInMs = System.currentTimeMillis() - startTimeInMs;
        long timeLeftInMs = timeoutInMs - elapsedTimeInMs;
        if (timeLeftInMs > 0) {
          Thread.sleep(timeLeftInMs);
        }
      }
      catch (InterruptedException e) {
        return; // resume execution when interrupted
      }

      // sleep finishes
      // remove thread from sleeping threads and throws
      guard.acquire();
      sleepingThreads.remove(Thread.currentThread());
      guard.release();
      throw new TimeoutException("Lock acquire timed out");
    }
    else {
      count--;
      guard.release();
    }
  }

}
