/* Copyright Exida */

#include "Std_Types.h"

TESTING_TOOLS_HEADER

uint8_t data = 0; /* ERROR_VAR */

void global_access_address_before(uint8_t *ptr) { /* ERROR_FUNC */
  uint8_t val; /* ERROR_VAR */

  /* misra should complain in any of these cases anyway */
  val = *(ptr - 1); /* runtime error: read */ /* ERROR_LINE */
  (void) val;
}

int main() {
  global_access_address_before(&data); /* ERROR_FUNC */
  return 0;
}
