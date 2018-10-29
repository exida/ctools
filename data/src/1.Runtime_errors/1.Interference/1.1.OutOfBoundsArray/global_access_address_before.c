/* Copyright Exida */

#include "Std_Types.h"

TESTING_TOOLS_HEADER

uint8_t data = 0u; // ERROR_VAR

void global_access_address_before(uint8_t *ptr) {// ERROR_LINE
  uint8_t val; // ERROR_VAR

  /* misra should complain in any of these cases anyway */
  val = *(ptr - 1u); /* runtime error: read */ // ERROR_LINE
  *(ptr - 1u) = 0u;  /* runtime error: write */ // ERROR_LINE
  (void) val;
}

int main() {
  global_access_address_before(&data); // ERROR_FUNC
  return 0;
}
