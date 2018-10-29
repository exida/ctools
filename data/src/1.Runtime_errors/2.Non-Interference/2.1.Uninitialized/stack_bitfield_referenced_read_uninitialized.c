/* Copyright Exida */

#include "Std_Types.h"

typedef struct {
  unsigned int nibble : 4;
  unsigned int single_bit_1 : 1;
  unsigned int single_bit_2 : 1;
  unsigned int double_bit_1 : 2;
} bitfield_struct;

uint32_t stack_bitfield_referenced_read_uninitialized(void) { /* ERROR_FUNC */
  bitfield_struct bf; /* ERROR_VAR */
  bf.nibble = 0xFU;
  bf.single_bit_2 = 1U;
  return (uint32_t)bf.single_bit_1; /* ERROR_LINE */
}

int main() {
  return (int) stack_bitfield_referenced_read_uninitialized();/* ERROR_FUNC */
}
