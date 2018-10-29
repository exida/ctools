/* Copyright Exida */
#include "Std_Types.h"

typedef struct {
  unsigned int nibble : 4;
  unsigned int single_bit_1 : 1;
  unsigned int single_bit_2 : 1;
  unsigned int double_bit_1 : 2;
} bitfield_struct;

uint32_t stack_bitfield_noinit_read_uninitialized(void) { /* ERROR_FUNC */
  bitfield_struct bf; /* ERROR_VAR */
  return (uint32_t)bf.single_bit_1; /* ERROR_LINE */ 
}

int main() {
  return (int) stack_bitfield_noinit_read_uninitialized(); /* ERROR_FUNC */
}
