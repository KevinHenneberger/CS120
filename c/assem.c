#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct
{
  char label[100];
  int  location;
} symbol_table_entry;

symbol_table_entry symbols[100];
int num_symbols = 0;

int add_symbol(char *label, int location)
{
  strcpy(symbols[num_symbols].label, label);
  symbols[num_symbols].location = location;

  ++num_symbols;
  return num_symbols;
}

int find_symbol(char *label)
{
  int i;

  for (i = 0; i < num_symbols; ++i)
    {
      if (strcmp(symbols[i].label, label) == 0)
	return symbols[i].location;
    }
  return -1;
}



int loc;
int first_pass;

int parse(char *buffer, unsigned int *mc)
{
  int rd, rs, rt, immediate;
  unsigned int machinecode;
  char label[1000];

  // Look for a label
  if (first_pass && (strstr(buffer, ":") != NULL))
    {
      sscanf(buffer, "%s", label);
      if (first_pass)
	add_symbol(label, loc);

      printf("Add label %s at %d\n", label, loc);
      return 0;
    }


  if (sscanf(buffer, " add $r%d, $r%d, $r%d", &rd, &rs, &rt) == 3)
    {

      machinecode = 0 << 26;
      machinecode |= (rs & 0x1F) << 21;
      machinecode |= (rt & 0x1F) << 16;
      machinecode |= (rd & 0x1F) << 11;
      machinecode |= 32;

      *mc = machinecode;
      return 1;
    }


  if (sscanf(buffer, " or $r%d, $r%d, $r%d", &rd, &rs, &rt) == 3)
    {

      machinecode = 0 << 26;
      machinecode |= (rs & 0x1F) << 21;
      machinecode |= (rt & 0x1F) << 16;
      machinecode |= (rd & 0x1F) << 11;
      machinecode |= 37;

      *mc = machinecode;
      return 1;
    }

  if (sscanf(buffer, " addi $r%d, $r%d, %d", &rs, &rt, &immediate) == 3)
    {

      machinecode = 8 << 26;
      machinecode |= (rs & 0x1F) << 21;
      machinecode |= (rt & 0x1F) << 16;
      machinecode |= immediate & 0xFFFF;

      *mc = machinecode;
      return 1;
    }

  if (sscanf(buffer, " ori $r%d, $r%d, %d", &rs, &rt, &immediate) == 3)
    {

      machinecode = 13 << 26;
      machinecode |= (rs & 0x1F) << 21;
      machinecode |= (rt & 0x1F) << 16;
      machinecode |= immediate & 0xFFFF;

      *mc = machinecode;
      return 1;
    }

  return 0;
}

int main(int argc, char *argv[])
{
  char buffer[1024];
  unsigned int mc;
  FILE *fp;

  if (argc != 2)
    {
      printf("Usage: assem filename\n");
      exit(1);
    }

  fp = fopen(argv[1], "r");
  if (fp == NULL)
    {
      printf("Could not open file %s\n", argv[1]);
      exit(1);
    }

  // Two passes.  First pass is really just about getting the symbol table figured out
  printf("First pass.\n");
  first_pass = 1;
  loc = 0;
  while (fgets(buffer, 1023, fp) != NULL)
    {
      if (parse(buffer, &mc) == 1)
	{
	  loc = loc + 4;
	}
    }
  fclose(fp);
  
  printf("Second pass.\n");
  fp = fopen(argv[1], "r");
  first_pass = 0;
  loc = 0;
  while (fgets(buffer, 1023, fp) != NULL)
    {
      if (parse(buffer, &mc) == 1)
	{
	  printf("%08x  %08x\n", loc, mc);
	  loc = loc + 4;
	}
    }
  fclose(fp);


  // Print out the symbol table
  for (int i = 0; i < num_symbols; ++i)
    {
      printf("%s  %08x\n", symbols[i].label, symbols[i].location);
    }
}
