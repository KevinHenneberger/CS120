#include <stdio.h>

int factorial(int n)
{
  if (n <= 1)
    return 1;
  else
    return n * factorial(n - 1);
}

int main()
{
  int result
  result = factorial(5);
  
  printf("Factorial of 5 is %d\n", result);
}
