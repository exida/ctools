/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

void heap_access_after(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  uint32_t *heap_array; 
  uint32_t val;

  heap_array = (uint32_t *)malloc(ARRAY_SIZE * sizeof(uint32_t));

  val = heap_array[runtime_0_uint + ARRAY_SIZE]; /* ERROR_LINE */
  heap_array[runtime_0_uint + ARRAY_SIZE] = 0;   /* ERROR_LINE */

  free(heap_array);
  (void) val;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  heap_access_after((uint32_t)runtime_1_int - 1);/* ERROR_FUNC */
  return 0;
}
