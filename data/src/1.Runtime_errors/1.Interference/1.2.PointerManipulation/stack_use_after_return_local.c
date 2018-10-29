/* Copyright Exida */

#include "Std_Types.h"

uint32_t *get_stack_pointer(void) {
  uint32_t local;
  return &local; /* ERROR_LINE */
}

void stack_use_after_return_local() {
  uint32_t *ptr;
  uint32_t var;

  ptr = get_stack_pointer(); /* ERROR_FUNC */

  var = *ptr; /* ERROR_LINE */
  *ptr = 0;   /* ERROR_LINE */
  (void) var;
}

int main() { 
  stack_use_after_return_local(); /* ERROR_FUNC */
  return 0;
}
