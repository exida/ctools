/* Copyright Exida */

#include "Std_Types.h"

#include "module_const_array.h"

void global_array_pointer_after(uint32_t runtime_0_uint, const uint32_t array[]) {
  uint32_t val;

  val = *(array + runtime_0_uint + ARRAY_SIZE); /* ERROR_LINE */
  (void) val;
}

int main(int runtime_1_int, char* argv[]) { (void) argv;
  module_const_array_Init();
  global_array_pointer_after((uint32_t)runtime_1_int - 1, module_const_array_array); /* ERROR_FUNC */
  return 0;
}

/* SPLIT TAG: module_const_array.c */

#include "Std_Types.h"

#include "module_const_array.h"

const uint32_t module_const_array_dummy_guard = 0;

const uint32_t module_const_array_array[ARRAY_SIZE] = {0}; /* ERROR_VAR */

void module_const_array_Init(void) {}
