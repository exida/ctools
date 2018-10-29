/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"
#include "string.h"

void uninitialized_memcpy_heap(void) { /* ERROR_FUNC */
  uint8_t dst[ARRAY_SIZE]; /* ERROR_VAR */
  uint8_t *buf = (uint8_t *)malloc((size_t) ARRAY_SIZE);

  memcpy(dst, buf, (size_t) ARRAY_SIZE); /* ERROR_LINE */

  free(buf);
}

int main() {
  uninitialized_memcpy_heap(); /* ERROR_FUNC */
  return 0;
}
