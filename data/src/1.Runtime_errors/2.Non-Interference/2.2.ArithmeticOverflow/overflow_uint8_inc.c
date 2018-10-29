/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

uint8_t integer_overflow_inc(uint32_t runtime_1_int) {
  uint8_t a = (uint8_t)(0xFEU + runtime_1_int); /* ERROR_VAR */

  a++; /* ERROR_LINE */

  return a;
}

int main(int runtime_1_int, char* argv[]) {
  (void) argv;
  (void)integer_overflow_inc((uint32_t) runtime_1_int);

  return 0;
}
