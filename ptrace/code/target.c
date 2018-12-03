#include <stdio.h>
#include <unistd.h>

int main()
{
  printf("PID: %d\n", (int)getpid());

  for (int i = 0; i < 10; i++)
  {
    sleep(5);
    write(1, "Waiting for attaching\n", 22);
  }
  getchar();

  return 0;
}
