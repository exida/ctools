/* Copyright Exida */

#include "Std_Types.h"

uint8_t global_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */

void global_array_through_pointer_after(uint32_t runtime_0_uint, uint8_t array[]) { /* ERROR_FUNC */
  uint8_t val;

  val = *(array + runtime_0_uint + ARRAY_SIZE); /* ERROR_LINE */
  *(array + runtime_0_uint + ARRAY_SIZE) = 0;   /* ERROR_LINE */
  (void) val;
}

int main(int runtime_1_int, char* argv[]) { 
  uint32_t var = (uint32_t) (runtime_1_int - 1);
  (void) argv;
  global_array_through_pointer_after(var, global_array); /* ERROR_FUNC */
  return 0;
}
