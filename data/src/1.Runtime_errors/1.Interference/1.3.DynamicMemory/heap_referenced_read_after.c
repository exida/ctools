/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

uint32_t heap_referenced_read_after(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  uint32_t *array = (uint32_t *)malloc(ARRAY_SIZE * sizeof(uint32_t)); /* ERROR_VAR */

  array[0] = 0;

  uint32_t res = array[runtime_0_uint + ARRAY_SIZE]; /* ERROR_LINE */

  free(array);

  return res;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  return (int) heap_referenced_read_after((uint32_t)runtime_1_int - 1); /* ERROR_FUNC */
}
