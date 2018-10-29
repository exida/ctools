/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

int8_t divide_by_minus_one(int32_t runtime_1_int) { /* ERROR_FUNC */
  int8_t a = (int8_t) (-127 - runtime_1_int);
  int8_t b = -1;
  int8_t c = (int8_t)(a / b); /* ERROR_LINE */

  (void) c;

  return (int8_t) (a / -1); /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  (void)divide_by_minus_one(runtime_1_int); /* ERROR_FUNC */

  return 0;
}
