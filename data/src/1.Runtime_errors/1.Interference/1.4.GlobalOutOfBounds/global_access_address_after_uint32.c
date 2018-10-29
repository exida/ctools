/* Copyright Exida */

#include "Std_Types.h"

#include "module_uint32.h"

void global_access_address_after(uint32_t *ptr) { /* ERROR_FUNC */
  uint32_t val;

  val = *(ptr + 1); /* runtime error: read */ /* ERROR_LINE */
  *(ptr + 1) = val; /* runtime error: write */ /* ERROR_LINE */
}

int main() {
  module_uint32_Init();
  global_access_address_after(&module_uint32_var); /* ERROR_FUNC */
  return 0;
}

/* SPLIT TAG: module_uint32.c */

#include "Std_Types.h"

#include "module_uint32.h"

uint32_t module_uint32_dummy_guard = 0;

uint32_t module_uint32_var = 0; /* ERROR_VAR */

void module_uint32_Init(void) {}
