/* Copyright Exida */

#include "Std_Types.h"

void access(uint32_t runtime_0_uint, uint8_t array[]) { /* ERROR_FUNC */
  uint8_t val;

  val = array[runtime_0_uint - 1]; /* ERROR_LINE */
  array[runtime_0_uint - 1] = 0;   /* ERROR_LINE */
  (void) val;
}

void stack_as_pointer_through_operator_before(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  uint8_t stack_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */
  access(runtime_0_uint, &stack_array[0]); /* ERROR_FUNC */
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  stack_as_pointer_through_operator_before((uint32_t)runtime_1_int - 1); /* ERROR_FUNC */
  return 0;
}
