/* Copyright Exida */

#include "Std_Types.h"

void null_dereference(void) { /* ERROR_FUNC */
  uint8_t *null_pointer = (uint8_t *)0; /* ERROR_VAR */
  uint8_t val;

  val = *null_pointer; /* ERROR_LINE */ 
  *null_pointer = 0;   /* ERROR_LINE */
  (void) val;
}

int main() {
  null_dereference(); /* ERROR_FUNC */
  return 0;
}
