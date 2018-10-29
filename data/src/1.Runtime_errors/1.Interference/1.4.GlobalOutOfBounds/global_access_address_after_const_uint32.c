/* Copyright Exida */

#include "Std_Types.h"

#include "module_const_uint32.h"

void global_access_address_after(const uint32_t *ptr) { /* ERROR_FUNC */
  uint32_t val;

  val = *(ptr + 1); /* runtime error: read */ /* ERROR_LINE */
  (void) val;
}

int main() {
  module_const_uint32_Init();
  global_access_address_after(&module_const_uint32_var); /* ERROR_FUNC */
  return 0;
}

/* SPLIT TAG: module_const_uint32.c */

#include "Std_Types.h"

#include "module_const_uint32.h"

const uint32_t module_const_uint32_dummy_guard = 0;

const uint32_t module_const_uint32_var = 0; /* ERROR_VAR */

void module_const_uint32_Init(void) {}
