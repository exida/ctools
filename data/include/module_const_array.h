#ifndef MODULE_CONST_ARRAY_H
#define MODULE_CONST_ARRAY_H

#include "Std_Types.h"

extern const uint32_t module_const_array_dummy_guard;

extern const uint32_t module_const_array_array[ARRAY_SIZE];

void module_const_array_Init(void);

#endif

