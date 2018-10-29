/* Copyright Exida */

#include "Std_Types.h"

#include "stdio.h"

void boom(void) { printf("unreachable code!\n"); }

void unreachable_code_boolean_invariant_const(void) {  /* ERROR_FUNC */
  if (2 + 2 != 4) {
    boom(); /* ERROR_LINE */
  }
}

int main() {
  unreachable_code_boolean_invariant_const();  /* ERROR_FUNC */

  return 0;
}
