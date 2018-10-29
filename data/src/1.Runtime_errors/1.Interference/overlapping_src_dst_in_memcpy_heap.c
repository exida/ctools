/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"
#include "string.h"

int overlapping_src_dst_in_memcpy_heap(void) { /* ERROR_FUNC */
  size_t s = 20;
  char* str = "Hello World!";
  char* buf = (char* )malloc(s); /* ERROR_VAR */

  size_t len = strlen(str);

//  memcpy(buf, str, len);
  memcpy(buf + s, str, len); /* ERROR_LINE */

  free(buf);

  return 0;
}

int main() {
  return overlapping_src_dst_in_memcpy_heap(); /* ERROR_FUNC */
}
