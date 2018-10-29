/* Copyright Exida */

#include "Std_Types.h"

TESTING_TOOLS_HEADER

uint32_t global_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */

uint32_t global_array_referenced_read_before(int32_t runtime_0_int) {  /* ERROR_FUNC */
  global_array[1] = 0;
  return global_array[runtime_0_int - 1];  /* ERROR_LINE */ 
}

int main(int runtime_1_int, char* argv[]) {
  (void) argv;
  return (int) global_array_referenced_read_before(runtime_1_int - 1);  /* ERROR_FUNC */
}
