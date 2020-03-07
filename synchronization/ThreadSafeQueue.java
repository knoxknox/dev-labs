package edu.Synchronization;

import java.util.Queue;
import java.util.ArrayDeque;
import java.util.concurrent.TimeoutException;

/**
 * Implements a thread-safe queue with a max size.
 * Operations add/get are both blocking if the queue is full/empty.
 */
public class ThreadSafeQueue<E> {
  Lock guard;
  int maxSize;
  Queue<E> queue;
  Semaphore slotsFull;
  Semaphore slotsEmpty;

  public ThreadSafeQueue(int maxNumElements) {
    maxSize = 0;
    guard = new Lock();
    slotsFull = new Semaphore(0);
    slotsEmpty = new Semaphore(maxNumElements);
    queue = new ArrayDeque<E>(maxNumElements);
  }

  public E get() {
    slotsFull.p();
    guard.acquire();
    E e = queue.remove();
    guard.release();
    slotsEmpty.v();
    return e;
  }

  public void add(E element) {
    slotsEmpty.p();
    guard.acquire();
    queue.add(element);
    guard.release();
    slotsFull.v();
  }

  public E getWithTimeout(int timeoutInMs) throws TimeoutException {
    long time = System.currentTimeMillis();
    slotsFull.p(timeoutInMs);
    guard.acquireWithTimeout((int)(timeoutInMs - (System.currentTimeMillis() - time)));
    E e = queue.remove();
    guard.release();
    slotsEmpty.v();
    return e;
  }

}
