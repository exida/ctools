
#include <stdint.h>

int use_int(int x)
{
  return x;
}

int main(void) {
  int x = 6;
unused_label: /* ERROR_LINE */
  return use_int(x);
}
