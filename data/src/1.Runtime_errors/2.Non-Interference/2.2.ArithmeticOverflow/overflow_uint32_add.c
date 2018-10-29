/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

uint32_t integer32_overflow_add(uint32_t runtime_1_uint) { /* ERROR_FUNC */
  uint32_t a = 4294967294U + runtime_1_uint; /* ERROR_LINE */
  uint32_t b = UINT_MAX;

  uint32_t ret = a + b; /* ERROR_FUNC */

  return ret;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv; 
  (void)integer32_overflow_add( (uint32_t) runtime_1_int); /* ERROR_FUNC */

  return 0;
}
