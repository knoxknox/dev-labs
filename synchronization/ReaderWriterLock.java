package edu.Synchronization;

import java.util.Queue;
import java.util.ArrayDeque;

/**
 * RWLock synchronization class.
 * Allow multiple readers, and prioritize waiting writers over waiting readers.
 */
public class ReaderWriterLock {
  int value;
  Lock guard;
  Queue<Thread> waitingReaders;
  Queue<Thread> waitingWriters;

  public ReaderWriterLock() {
    value = 0;
    guard = new Lock();
    waitingReaders = new ArrayDeque<Thread>();
    waitingWriters = new ArrayDeque<Thread>();
  }

  /**
   * Locks the readers lock.
   */
  public void readLock() {
    guard.acquire();
    if ((value >= 0) && waitingWriters.isEmpty()) {
      value++;
      guard.release();
    }
    else {
      waitingReaders.add(Thread.currentThread());
      guard.release();
      try {
        Thread.sleep(Semaphore.MAX_SLEEP);
      }
      catch (InterruptedException e) {
      }
    }
  }

  /**
   * Unlocks the readers lock.
   */
  public void readUnlock() {
    guard.acquire();
    if ((value == 1) && !waitingWriters.isEmpty()) {
      value = -1;
      Thread next = waitingWriters.remove();
      guard.release();
      next.interrupt();
    }
    else {
      value--;
      assert value >= 0;
      guard.release();
    }
  }

  /**
   * Locks the writers lock.
   */
  public void writeLock() {
    guard.acquire();
    if (value == 0) {
      value--;
      guard.release();
    }
    else {
      waitingWriters.add(Thread.currentThread());
      guard.release();
      try {
        Thread.sleep(Semaphore.MAX_SLEEP);
      }
      catch (InterruptedException e) {
      }
    }
  }

  /**
   * Unlocks the writers lock.
   */
  public void writeUnlock() {
    guard.acquire();
    if (!waitingWriters.isEmpty()) {
      Thread next = waitingWriters.remove();
      guard.release();
      next.interrupt();
    }
    else if (!waitingReaders.isEmpty()) {
      value = waitingReaders.size();
      for (Thread reader : waitingReaders) {
        reader.interrupt();
      }
      waitingReaders.clear();
      guard.release();
    }
    else {
      value++;
      assert value == 0;
      guard.release();
    }
  }

}
