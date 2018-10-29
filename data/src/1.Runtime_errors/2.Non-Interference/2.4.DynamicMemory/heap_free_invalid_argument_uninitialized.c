/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

void heap_free_invalid_argument_uninitialized(void) { /* ERROR_FUNC */
  uint32_t *heap_ptr; /* ERROR_VAR */

  free(heap_ptr); /* ERROR_LINE */
}

int main() {
  heap_free_invalid_argument_uninitialized();  /* ERROR_FUNC */
  return 0;
}
