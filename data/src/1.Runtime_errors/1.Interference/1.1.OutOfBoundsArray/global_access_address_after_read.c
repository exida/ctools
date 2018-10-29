/* Copyright Exida */

#include "Std_Types.h"

uint8_t data = 0; /* ERROR_VAR */

void global_access_address_after(uint8_t *ptr) { /* ERROR_FUNC */
  uint8_t val;

  /* misra should complain in any of these cases anyway */
  val = *(ptr + 1); /* runtime error: read */ /* ERROR_LINE */
  (void) val;
}

int main() {
  global_access_address_after(&data);/* ERROR_FUNC */
  return 0;
}
