/* Copyright Exida */

#include "Std_Types.h"

struct_64_type global_array[ARRAY_SIZE]; /* ERROR_VAR */

void global_array_of_structs_access_after(uint8_t runtime_0_int) /* ERROR_FUNC */
{
	struct_64_type val = {
			.field_uint8_a=0,
			.field_uint8_b=0,
			.field_uint8_c=0,
			.field_uint8_d=0,
			.field_uint32=0
	};

	val = global_array[runtime_0_int + ARRAY_SIZE]; /* ERROR_LINE */
	global_array[runtime_0_int + ARRAY_SIZE] = val; /* ERROR_LINE */
}

int main(int argc, char **argv)
{
  uint8_t var = (uint8_t) (argc -1);
  (void) argv;
  global_array_of_structs_access_after(var); /* ERROR_FUNC */
  return 0;
}
