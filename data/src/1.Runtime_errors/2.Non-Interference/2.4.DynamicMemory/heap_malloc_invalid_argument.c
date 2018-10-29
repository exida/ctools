/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

void heap_malloc_invalid_argument(int32_t runtime_0_int) { /* ERROR_FUNC */
  uint8_t *heap_ptr;

  heap_ptr = (uint8_t *)malloc(runtime_0_int - 1); /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) { (void) argv;
  heap_malloc_invalid_argument(runtime_1_int - 1); /* ERROR_FUNC */
  return 0;
}
