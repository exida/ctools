/* Copyright Exida */

#include "Std_Types.h"

uint32_t *get_stack_pointer_indirectly(void) {
  uint32_t local;
  uint32_t *tmp;
  tmp = &local; /* ERROR_LINE */
  return tmp;
}

void stack_use_after_return_local_indirectly(void) {
  uint32_t *dangling_ptr;
  uint32_t val;

  dangling_ptr = get_stack_pointer_indirectly(); /* ERROR_FUNC */

  val = *dangling_ptr; /* ERROR_LINE */
  *dangling_ptr = 0;   /* ERROR_LINE */
  (void) val;
}

int main() {
  stack_use_after_return_local_indirectly(); /* ERROR_FUNC */
  return 0;
}
