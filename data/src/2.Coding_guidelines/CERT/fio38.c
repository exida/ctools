#include <stdio.h>
  
int main(void) 
{
  FILE my_stdout = *stdout;
  return fputs("Hello, World!\n", &my_stdout); /* ERROR_LINE */
}
