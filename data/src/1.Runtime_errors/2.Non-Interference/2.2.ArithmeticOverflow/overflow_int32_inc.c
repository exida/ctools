/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

int32_t integer32_overflow_increment(int32_t runtime_1_int) { /* ERROR_FUNC */
  int32_t a = INT_MAX - 1 + runtime_1_int;

  a++; /* ERROR_LINE */

  return a;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  (void)integer32_overflow_increment(runtime_1_int); /* ERROR_FUNC */

  return 0;
}
