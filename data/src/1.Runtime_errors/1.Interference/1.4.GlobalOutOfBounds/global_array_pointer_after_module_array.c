/* Copyright Exida */

#include "Std_Types.h"

#include "module_array.h"

void global_array_pointer_after(uint32_t runtime_0_uint, uint32_t array[]) { /* ERROR_FUNC */
  uint32_t val;

  val = *(array + runtime_0_uint + ARRAY_SIZE); /* ERROR_LINE */ 
  *(array + runtime_0_uint + ARRAY_SIZE) = val; /* ERROR_LINE */
  (void) val;
}

int main(int runtime_1_int, char* argv[]) { 
  (void) argv;
  module_array_Init();
  global_array_pointer_after((uint32_t)runtime_1_int - 1, module_array_array); /* ERROR_FUNC */
  return 0;
}

/* SPLIT TAG: module_array.c */

#include "Std_Types.h"

#include "module_array.h"

uint32_t module_array_dummy_guard = 0;

uint32_t module_array_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */

void module_array_Init(void) {}
