/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

uint8_t integer_overflow_cast(uint32_t runtime_1_int) {
  uint32_t to_cast = 255 + runtime_1_int;

  uint8_t casted = to_cast;
  uint8_t explicit_casted = (uint8_t)to_cast;

  return casted;
}

int main(int runtime_1_int) {
  (void)integer_overflow_cast(runtime_1_int);

  return 0;
}
