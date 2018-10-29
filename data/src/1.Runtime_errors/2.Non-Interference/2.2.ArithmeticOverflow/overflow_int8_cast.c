/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

int8_t integer_overflow_cast(int32_t runtime_1_int) {
  int32_t to_cast = 255 + runtime_1_int;
  int8_t casted = to_cast;
  int8_t explicit_casted = (int8_t)to_cast;

  int32_t to_cast_safe = runtime_1_int;
  int8_t casted_safe = to_cast_safe;
  int8_t explicit_casted_safe = (int8_t)to_cast_safe;

  return casted;
}

int main(int runtime_1_int, char* argv[]) { (void) argv;
  (void)integer_overflow_cast(runtime_1_int);

  return 0;
}
