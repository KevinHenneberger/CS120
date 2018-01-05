#include <stdio.h>

int a[] = {3, 4, 5, 7, 0};
int b[] = {2, 3, 10, 0};

int reveal(int *x)
{
  // a0 has a pointer.  To get *x, it's something like
  // lw $t0, 0($a0)
  // beq $t0, $0, end_of_while_loop
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
  int z[] = {10, 20, 0};

  printf("Here's A\n");
  reveal(a);

  printf("Here's B\n");
  reveal(b);

  printf("Here's Z\n");
  reveal(z);

  printf("And how about the function reveal?  It's at %p\n", reveal);
  printf("What about main?  It's at %p\n", main);
}
