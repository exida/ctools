/* Copyright Exida */

#include "Std_Types.h"

uint32_t stack_array_referenced_read_uninitialized(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  uint32_t stack_array[ARRAY_SIZE]; /* ERROR_VAR */
  stack_array[0] = 0;
  return stack_array[runtime_0_uint + 2]; /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  return (int) stack_array_referenced_read_uninitialized((uint32_t)runtime_1_int - 1); /* ERROR_FUNC */
}
