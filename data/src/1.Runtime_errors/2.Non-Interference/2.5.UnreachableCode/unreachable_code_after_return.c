/* Copyright Exida */

#include "Std_Types.h"

#include "stdio.h"

void boom(void) { printf("unreachable code!\n"); }

uint8_t unreachable_code_after_return(void) { /* ERROR_FUNC */
  uint8_t a = 6;

  return a * (a + 1);

  boom(); /* ERROR_LINE */
}

int main() {
  unreachable_code_after_return(); /* ERROR_FUNC */
  return 0;
}
