/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

uint32_t integer32_overflow_increment(uint32_t runtime_1_uint) { /* ERROR_FUNC */
  uint32_t a = 4294967294U + runtime_1_uint; /* ERROR_VAR */

  a++; /* ERROR_LINE */

  return a;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  (void) integer32_overflow_increment((uint32_t) runtime_1_int); /* ERROR_FUNC */

  return 0;
}
