/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

void heap_use_after_free(void) { /* ERROR_FUNC */
  uint8_t *heap_ptr; /* ERROR_VAR */
  uint8_t val; /* ERROR_VAR */

  heap_ptr = (uint8_t *)malloc(ARRAY_SIZE * sizeof(uint8_t));

  free(heap_ptr);

  val = heap_ptr[0]; /* ERROR_LINE */
  (void) val;
}

int main() {
  heap_use_after_free(); /* ERROR_FUNC */
  return 0;
}
