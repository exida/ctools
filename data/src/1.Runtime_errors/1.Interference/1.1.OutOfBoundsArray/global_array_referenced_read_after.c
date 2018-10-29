/* Copyright Exida */

#include "Std_Types.h"

uint32_t global_array[ARRAY_SIZE] = {0};  /* ERROR_VAR */

uint32_t global_array_referenced_read_after(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  global_array[0] = 0;
  return global_array[runtime_0_uint + ARRAY_SIZE];  /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) { 
  uint32_t var = (uint32_t) (runtime_1_int -1); /* ERROR_VAR */
  (void) argv;
  return (int) global_array_referenced_read_after(var); /* ERROR_FUNC */
}
