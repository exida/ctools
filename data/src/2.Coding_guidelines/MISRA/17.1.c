#include <stdint.h>
#include <stdarg.h> /* ERROR_LINE */

void f(int count, ...) {
  int v;
  va_list l1, l2;          /* ERROR_LINE */
  va_start(l1, count);     /* ERROR_LINE */
  va_copy(l2, l1);         /* ERROR_LINE */
  v = va_arg(l1, int); /* ERROR_LINE */
  (void)v;
  va_end(l1); /* ERROR_LINE */
}

int main(void)
{
  f(5, 1,2,3,4,5);
  return 0;
}
