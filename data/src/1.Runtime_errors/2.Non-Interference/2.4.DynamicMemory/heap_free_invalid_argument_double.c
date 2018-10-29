/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

void heap_free_invalid_argument_double(void) { /* ERROR_FUNC */
  uint32_t *heap_ptr; /* ERROR_VAR */

  heap_ptr = (uint32_t *)malloc(ARRAY_SIZE * sizeof(uint32_t));

  free(heap_ptr);
  free(heap_ptr); /* ERROR_LINE */
}

int main() {
  heap_free_invalid_argument_double(); /* ERROR_FUNC */
  return 0;
}
