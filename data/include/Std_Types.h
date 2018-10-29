/* Copyright 2015 Exida */

#ifndef STD_TYPES_H
#define STD_TYPES_H

#define ARRAY_SIZE 100

#ifdef PCLINT
typedef int int32_t;

typedef unsigned int uint32_t;
typedef unsigned char uint8_t;

#else

#include <stdint.h>




#endif

//typedef uint32_t * ptr_uint32_t;
//typedef uint8_t * ptr_uint8_t;

typedef struct {
  uint8_t field_uint8_a;
  uint8_t field_uint8_b;
  uint32_t field_uint32;
} struct_48_type;

typedef struct {
  uint8_t field_uint8_a;
  uint8_t field_uint8_b;
  uint8_t field_uint8_c;
  uint8_t field_uint8_d;
  uint32_t field_uint32;
} struct_64_type;

#ifdef TESTING
#define TESTING_TOOLS_HEADER uint32_t dummy_guard = 0; const uint32_t dummy_const_guard = 0;
#else
#define TESTING_TOOLS_HEADER
#endif

#endif

