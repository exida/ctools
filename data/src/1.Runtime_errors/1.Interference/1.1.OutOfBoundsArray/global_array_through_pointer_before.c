/* Copyright Exida */

#include "Std_Types.h"

TESTING_TOOLS_HEADER

uint8_t global_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */

void global_array_through_pointer_before(uint32_t runtime_0_uint, uint8_t array[]) { /* ERROR_FUNC */
  uint8_t val;

  val = *(array + runtime_0_uint - 1); /* ERROR_LINE */
  *(array + runtime_0_uint - 1) = 0;   /* ERROR_LINE */
  (void) val;
}

int main(int runtime_1_int, char* argv[]) {
  (void) argv;
  global_array_through_pointer_before((uint32_t)(runtime_1_int - 1), global_array); /* ERROR_FUNC */
  return 0;
}
