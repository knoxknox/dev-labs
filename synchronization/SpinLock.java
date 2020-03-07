package edu.Synchronization;

import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Implementation of a simple spin lock.
 */
public class SpinLock implements LockInterface {
  private AtomicBoolean lock;

  public SpinLock() {
    lock = new AtomicBoolean(false);
  }

  /**
   * Tries to acquires this lock.
   * This method will spin wait (loop infinitely) until the lock is freed.
   */
  public void acquire() {
    while (lock.getAndSet(true)) Thread.yield();
  }

  /**
   * Releases this lock.
   * This method should only be called if the thread currently has acquired the lock.
   */
  public void release() {
    lock.set(false);
  }

  /**
   * Tries to acquires this lock within the timeout in milliseconds.
   * This method will spin wait (loop infinitely) until the lock is freed.
   */
  public void acquireWithTimeout(int timeoutInMs) throws TimeoutException {
    long startTime = System.currentTimeMillis();
    while (lock.getAndSet(true)) {
      Thread.yield();
      long elapsedTime = System.currentTimeMillis() - startTime;
      if (elapsedTime > timeoutInMs) {
        throw new TimeoutException("SpinLock acquire timed out");
      }
    }
  }

}
