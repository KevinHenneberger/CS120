#include <stdio.h>

int a[] = {3, 8, 11, 1, 0};

int findmin(int *data)
{
  int s0, v0;

  v0 = *data;
    
  while (*data != 0)
  {
    s0 = *data;
        
    if (s0 < v0) {
      v0 = s0;
    }
        
    data = data + 1;
  }

  return v0;
}

int main()
{
  int v0 = findmin(a);

  printf("Minimum is %d\n", v0);
}
