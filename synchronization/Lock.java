package edu.Synchronization;

import java.util.concurrent.TimeoutException;

/**
 * Lock class that enforces mutual exclusion.
 * Note that this is implemented via Binary Semaphore.
 */
public class Lock extends Semaphore implements LockInterface {

  public Lock() {
    super(1);
  }

  /**
   * Tries to acquire this lock, blocking indefinitely until it is free.
   */
  public void acquire() {
    p();
  }

  /**
   * Releases this lock so other threads may use it.
   * Note that this should ONLY be called by the thread that acquired this lock.
   */
  public void release() {
    v();
  }

  /**
   * Tries to acquire this lock, blocking until either
   * a TimeoutException is thrown or the lock is released.
   */
  public void acquireWithTimeout(int timeoutInMs) throws TimeoutException {
    p(timeoutInMs);
  }

}
