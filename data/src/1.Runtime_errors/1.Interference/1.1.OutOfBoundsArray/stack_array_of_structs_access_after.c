/* Copyright Exida */

#include "Std_Types.h"

void stack_array_of_structs_access_after(uint32_t runtime_0_uint) { /* ERROR_FUNC */
  struct_64_type stack_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */
  struct_64_type val = {.field_uint8_a = 0,
                        .field_uint8_b = 0,
                        .field_uint8_c = 0,
                        .field_uint8_d = 0,
                        .field_uint32 = 0};

  val = stack_array[runtime_0_uint + ARRAY_SIZE]; /* ERROR_LINE */
  stack_array[runtime_0_uint + ARRAY_SIZE] = val; /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) {
  (void) argv;
  stack_array_of_structs_access_after((uint32_t)runtime_1_int - 1); /* ERROR_FUNC */
  return 0;
}
