/* Copyright Exida */

#include <stdio.h>

#include "Std_Types.h"

#include "limits.h"

int32_t integer32_overflow_add(int32_t runtime_1_int) { /* ERROR_FUNC */
  int32_t ok = 2147483647 + 2147483647;  /* ERROR_LINE */
  int32_t er = INT_MAX + INT_MAX;        /* ERROR_LINE */

  int32_t a = INT_MAX;
  int32_t ret = a + runtime_1_int;  /* ERROR_LINE */

  return ok + er + ret; /* ERROR_LINE */
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  (void)integer32_overflow_add(runtime_1_int); /* ERROR_FUNC */

  return 0;
}