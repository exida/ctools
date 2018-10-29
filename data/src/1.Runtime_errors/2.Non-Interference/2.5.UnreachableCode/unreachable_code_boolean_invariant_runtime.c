/* Copyright Exida */

#include "Std_Types.h"

#include "stdio.h"

void boom() { printf("unreachable code!\n"); }

void unreachable_code_boolean_invariant_runtime(int32_t runtime_2_int) { /* ERROR_FUNC */
  if (runtime_2_int * runtime_2_int < 0) {
    boom(); /* ERROR_LINE */
  }
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  unreachable_code_boolean_invariant_runtime(runtime_1_int + 1); /* ERROR_FUNC */

  return 0;
}
