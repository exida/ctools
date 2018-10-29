/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

int32_t divide_by_minus_one(int32_t runtime_1_int) { /* ERROR_FUNC */
  int32_t a = INT_MIN + 1 - runtime_1_int; 
  int32_t b = a / -1;  /* ERROR_LINE */

  return b;
}
int32_t divide_by_minus_one_macro(void) {
  return INT_MIN / -1;  /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  (void)divide_by_minus_one(runtime_1_int); /* ERROR_FUNC */
  (void)divide_by_minus_one_macro(); /* ERROR_FUNC */

  return 0;
}
