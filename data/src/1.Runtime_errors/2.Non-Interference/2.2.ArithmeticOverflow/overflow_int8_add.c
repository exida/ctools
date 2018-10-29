/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

int8_t integer_overflow_add(int32_t runtime_1_uint) { /* ERROR_FUNC */
  int8_t e = (runtime_1_uint == 1) ? 1 : 0;
  int8_t a = (int8_t) (63 + e);
  int8_t b = (int8_t) 64;

  int8_t d = (int8_t)(a + b); /* ERROR_LINE */

  return d;
}

int main(int runtime_1_int, char* argv[]) {
  (void) argv;
  (void)integer_overflow_add(runtime_1_int); /* ERROR_FUNC*/

  return 0;
}
