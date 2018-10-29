/* Copyright Exida */

#include "Std_Types.h"

TESTING_TOOLS_HEADER

uint8_t data = 0;  /* ERROR_VAR */

void global_access_address_before(uint8_t *ptr) { /* ERROR_FUNC */
  /* misra should complain in any of these cases anyway */
  *(ptr - 1) = 0; /* runtime error: write */ /* ERROR_LINE */
}

int main() {
  global_access_address_before(&data); /* ERROR_FUNC */
  return 0;
}
