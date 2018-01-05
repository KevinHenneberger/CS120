#include <stdio.h>

char a[] = "hello world";
char b[] = "goodbye cruel world.";

int reveal(char *x)
{
  while (*x != 0)
    {
      printf("X points to memory location %p, and has the value %d\n",
	     x, *x);
      x = x + 1;
    }

  return 0;
}


int main()
{
  char z[] = "ASCII array.  Very useful.  Ends with zero";

  printf("Here's A\n");
  reveal(a);

  printf("Here's B\n");
  reveal(b);

  printf("Here's Z\n");
  reveal(z);

  printf("And how about the function reveal?  It's at %p\n", reveal);
  printf("What about main?  It's at %p\n", main);
}
