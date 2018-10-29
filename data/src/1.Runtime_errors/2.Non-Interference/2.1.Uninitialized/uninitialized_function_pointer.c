/* Copyright Exida */

#include "Std_Types.h"

typedef void (*void_f)(void);

void uninitialized_function_pointer(void) { /* ERROR_FUNC */
  void_f func; /* ERROR_VAR */

  (*func)(); /* ERROR_LINE */
}

int main() {
  uninitialized_function_pointer(); /* ERROR_FUNC */
  return 0;
}
