package edu.Synchronization;

import java.util.concurrent.TimeoutException;

public interface LockInterface {
  public void acquire();
  public void release();
  public void acquireWithTimeout(int timeoutInMs) throws TimeoutException;
}
