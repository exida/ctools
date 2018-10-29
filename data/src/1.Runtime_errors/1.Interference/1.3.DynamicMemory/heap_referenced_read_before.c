/* Copyright Exida */

#include "Std_Types.h"

#include "stdlib.h"

uint32_t heap_referenced_read_after(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  uint32_t *array = (uint32_t *)malloc(100 * sizeof(uint32_t)); /* ERROR_VAR */
  uint32_t res;
  array[0] = 0;
  
  res = array[runtime_0_uint - 1]; /* ERROR_LINE */
  
  free(array);

  return res;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  return (int) heap_referenced_read_after((uint32_t)runtime_1_int - 1);/* ERROR_FUNC */
}
