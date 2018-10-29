/* Copyright Exida */

#include "Std_Types.h"

uint32_t *ptr; /* ERROR_VAR */

void store_pointer(uint32_t arg) /* ERROR_FUNC */
{
  ptr = &arg; /* ERROR_LINE */
} 

void stack_use_after_return_copy_to_static(uint32_t runtime_0_uint) {
  uint32_t val;

  store_pointer(runtime_0_uint); /* ERROR_FUNC */

  val = *ptr; /* ERROR_LINE */
  *ptr = 0;   /* ERROR_LINE */
  (void) val;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  stack_use_after_return_copy_to_static((uint32_t)runtime_1_int - 1); /* ERROR_FUNC */
  return 0;
}
