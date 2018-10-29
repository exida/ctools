/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

int8_t integer_overflow_inc(int32_t runtime_1_int) { /* ERROR_FUNC */
  int8_t a = (int8_t) (126 + runtime_1_int); /* ERROR_VAR */

  a++; /* ERROR_LINE */

  return a;
}

int main(int runtime_1_int, char* argv[]) {
  (void) argv;
  (void)integer_overflow_inc(runtime_1_int); /* ERROR_FUNC */

  return 0;
}
