/* Copyright Exida */

#include "Std_Types.h"

void get_pointer(uint32_t **pptr) { /* ERROR_FUNC */
  uint32_t local; /* ERROR_VAR */
  *pptr = &local; /* ERROR_LINE */
}

void stack_use_after_return_by_argument(void) { /* ERROR_FUNC */
  uint32_t *ptr;
  uint32_t val;

  get_pointer(&ptr);

  val = *ptr; /* ERROR_LINE */
  *ptr = 0;   /* ERROR_LINE */
  (void) val;
}

int main() {
  stack_use_after_return_by_argument(); /* ERROR_FUNC */
  return 0;
}
