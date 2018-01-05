#include <stdio.h>

typedef struct
{
  int x;
  int y;
  int z;
} example;


example global_a, global_b, global_c;

void add_them(example *a)
{
  printf("Add_them using a pointer.  a is at %p in memory\n", a);
  a->z = a->x + a->y;
}

void add_them2(example a)
{
  printf("Add_them sending a value.  a is at %p in memory\n", &a);
  a.z = a.x + a.y;
}


int main()
{
  example local_structure;

  printf("Global_a is at %p in memory\n", &global_a);
  printf("Global_b is at %p in memory\n", &global_b);
  printf("local_structure is at %p in memory\n", &local_structure);

  global_a.x = 10;
  global_a.y = 20;
  add_them(&global_a);
  printf("Global_a.z is %d\n", global_a.z);

  global_b.x = 20;
  global_b.y = 30;
  add_them2(global_b);
  printf("Global_b.z is %d\n", global_b.z);
}
