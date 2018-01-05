#include <stdio.h>

void setvalues(int*  a, int*   b)
{
  *a = *a + 10;
  *b = *b + 20;
  printf("A is at %p, and contains %d\n", a, *a);
  printf("B is at %p, and contains %d\n", b, *b);
}

int main()
{
  int a = 5;
  int b = 6;

  setvalues(&a, &b);

  printf("A is %d and B is %d\n", a, b);
}