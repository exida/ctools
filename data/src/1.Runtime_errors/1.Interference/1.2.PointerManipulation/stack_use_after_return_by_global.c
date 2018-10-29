/* Copyright Exida */

#include "Std_Types.h"

uint32_t *ptr; /* ERROR_VAR */

void store_pointer(void) { /* ERROR_FUNC */
  uint32_t local;
  ptr = &local; /* ERROR_LINE */
}

void stack_use_after_return_copy_to_static(void) { /* ERROR_FUNC */
  uint32_t val;
 
  store_pointer(); /* ERROR_FUNC */

  val = *ptr; /* ERROR_LINE */
  *ptr = 0;   /* ERROR_LINE */
  (void) val;
}

int main() {
  stack_use_after_return_copy_to_static(); /* ERROR_FUNC */
  return 0;
}
