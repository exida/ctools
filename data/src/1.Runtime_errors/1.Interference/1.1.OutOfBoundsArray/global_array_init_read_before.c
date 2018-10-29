/* Copyright Exida */

#include "Std_Types.h"

TESTING_TOOLS_HEADER

uint32_t global_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */

uint32_t global_array_init_read_before(uint32_t runtime_0_int) {   /* ERROR_FUNC */
  return global_array[runtime_0_int - 1U];  /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) {
  uint32_t var = (uint32_t) (runtime_1_int - 1);
  (void) argv;
  return (int) global_array_init_read_before(var);   /* ERROR_FUNC */
}
