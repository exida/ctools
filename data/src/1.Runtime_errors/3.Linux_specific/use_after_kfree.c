/* Copyright Exida */ 
#include "Std_Types.h"

#include "stdlib.h"

void* kmalloc(size_t size)
{
    return malloc(size);
}

void kfree(void* ptr)
{
    free(ptr);
}

void use_after_kfree(void) { /* ERROR_FUNC */
  uint8_t *heap_ptr; /* ERROR_VAR */
  uint8_t val; /* ERROR_VAR */

  heap_ptr = kmalloc(ARRAY_SIZE * sizeof(uint8_t));

  kfree(heap_ptr);

  val = heap_ptr[0]; /* ERROR_LINE */
  (void) val;
}

int main() {
  use_after_kfree(); /* ERROR_FUNC */
  return 0;
}
