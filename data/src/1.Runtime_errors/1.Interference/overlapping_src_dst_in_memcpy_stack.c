/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"
#include "string.h"

int overlapping_src_dst_in_memcpy_stack(void) { /* ERROR_FUNC */
  char *str = "Hello World!";
  char buf[32];

  size_t len = strlen(str);

  memcpy(buf, str, len);
  memcpy(buf + 8, buf, len); /* ERROR_LINE */

  return 0;
}

int main() {
  return overlapping_src_dst_in_memcpy_stack(); /* ERROR_FUNC */
}
