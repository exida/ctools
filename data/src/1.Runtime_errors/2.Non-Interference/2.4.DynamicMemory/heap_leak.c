/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

void heap_leak(void) { /* ERROR_FUNC */
  uint32_t *heap_ptr; /* ERROR_LINE */

  heap_ptr = (uint32_t *)malloc(ARRAY_SIZE * sizeof(uint32_t)); /* ERROR_LINE */
  (void) heap_ptr;
}

int main() {
  heap_leak(); /* ERROR_FUNC */
  return 0;
}
