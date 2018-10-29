/* Copyright Exida */

#include "Std_Types.h"

TESTING_TOOLS_HEADER

struct_64_type global_array[ARRAY_SIZE] = {{.field_uint8_a = 0, /* ERROR_VAR */
                                            .field_uint8_b = 0, /* ERROR_VAR */
                                            .field_uint8_c = 0, /* ERROR_VAR */
                                            .field_uint8_d = 0, /* ERROR_VAR */
                                            .field_uint32 = 0}}; /* ERROR_VAR */

void global_array_of_structs_access_before(int32_t runtime_0_int) { /* ERROR_FUNC */
  struct_64_type val = {.field_uint8_a = 0,
                        .field_uint8_b = 0,
                        .field_uint8_c = 0,
                        .field_uint8_d = 0,
                        .field_uint32 = 0};

  val = global_array[runtime_0_int - 1]; /* ERROR_LINE */
  global_array[runtime_0_int - 1] = val; /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) {
  (void) argv;
  global_array_of_structs_access_before(runtime_1_int - 1); /* ERROR_LINE */
  return 0;
}
