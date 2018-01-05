#include <stdio.h>

int func1()
{
  int x, y, z;
  x = 10;
  y = 20;
  z = 30;

  return 0;
}

int func2()
{
  int a, b, c;

  printf("A, B, C are %d %d %d\n", a, b, c);
  return 0;
}

int main()
{
  func1();
  func2();
}
