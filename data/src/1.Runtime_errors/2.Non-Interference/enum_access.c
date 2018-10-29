/* Copyright Exida */

#include "Std_Types.h"

typedef enum { RED = 0U, GREEN = 1U, BLUE = 2U } color_enum;

void enum_access(void) { /* ERROR_FUNC */
  color_enum ce = 3U; /* ERROR_LINE */
  color_enum cec = ce; /* ERROR_LINE */
(void) cec;
}

int main() {
  enum_access(); /* ERROR_FUNC */
  return 0;
}
