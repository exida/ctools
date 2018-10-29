/* Copyright Exida */

#include "Std_Types.h"

uint32_t stack_array(void) {
  uint32_t array[100]; /* ERROR_VAR */
  return array[0]; /* ERROR_LINE */
}

uint32_t stack_int(void) {
  uint32_t a; /* ERROR_VAR */
  return a; /* ERROR_LINE */
}

uint32_t stack_int_referenced(void) {
  uint32_t a;
  uint32_t* b;
  b = &a; /* ERROR_LINE */
  return *b; /* ERROR_LINE */
}

int main() {
  uint32_t res = 0;

  res += stack_array(); /* ERROR_FUNC */
  res += stack_int(); /* ERROR_FUNC */
  res += stack_int_referenced(); /* ERROR_FUNC */

  return (int) res;
}
