/* Copyright Exida */

#include "Std_Types.h"

uint32_t stack_int_read_uninitialized(void) { /* ERROR_FUNC */
  uint32_t x; /* ERROR_VAR */
  return x; /* ERROR_LINE */
}

int main() {
  return (int) stack_int_read_uninitialized(); /* ERROR_FUNC */
}
