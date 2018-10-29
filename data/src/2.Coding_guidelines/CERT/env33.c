#include <string.h>
#include <stdlib.h>
#include <stdio.h>
 
enum { BUFFERSIZE = 512 };
 
int func(const char *input) 
{
  char cmdbuf[BUFFERSIZE];
  snprintf(cmdbuf, (size_t) BUFFERSIZE, "any_cmd '%s'", input);
  return system(cmdbuf); /* ERROR_LINE */
}

int main(void)
{
  //func("happy'; useradd 'attacker");
  return func("ls");
}
