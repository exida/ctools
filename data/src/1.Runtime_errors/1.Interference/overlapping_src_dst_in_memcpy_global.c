/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"
#include "string.h"

char buf[32];

uint32_t overlapping_src_dst_in_memcpy_global(void) { /* ERROR_FUNC */
  char *str = "Hello World!";

  size_t len = strlen(str);

  memcpy(buf, str, len);
  memcpy(buf + 8, buf, len); /* ERROR_LINE */

  return 0;
}

int main() {
  return (int) overlapping_src_dst_in_memcpy_global(); /* ERROR_FUNC */
}
