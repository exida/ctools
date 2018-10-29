/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"
#include "string.h"

void uninitialized_memcpy_stack(void) { /* ERROR_FUNC */
  uint8_t buf[ARRAY_SIZE]; /* ERROR_VAR */
  uint8_t dst[ARRAY_SIZE]; /* ERROR_VAR */

  memcpy(dst, buf, (size_t) ARRAY_SIZE); /* ERROR_LINE */
}

int main() {
  uninitialized_memcpy_stack(); /* ERROR_FUNC */
  return 0;
}
