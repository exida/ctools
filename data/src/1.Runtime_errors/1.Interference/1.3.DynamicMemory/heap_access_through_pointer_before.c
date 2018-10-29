/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

void heap_access_through_pointer_before(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  uint8_t *heap_ptr;
  uint8_t val;

  heap_ptr = (uint8_t *)malloc(ARRAY_SIZE * sizeof(uint8_t));

  val = *(heap_ptr + runtime_0_uint - 1); /* ERROR_LINE */
  *(heap_ptr + runtime_0_uint - 1) = 0;   /* ERROR_LINE */

  free(heap_ptr);
  (void) val;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  heap_access_through_pointer_before(runtime_1_int - 1); /* ERROR_FUNC */
  return 0;
}
