#include <stdio.h>

int setvalues(int a, int b)
{
  a = a + 10;
  b = b + 20;
  printf("A is %d, B is %d\n", a, b);
  return a;
}

int main()
{
  int a = 5;
  int b = 6;

  setvalues(a, b);

  printf("A is %d and B is %d\n", a, b);
}