/* Copyright Exida */
#include "Std_Types.h"

uint32_t wrong_init(void) {
  uint32_t stack_array[100] =
      {-1}; /* runtime error - this should warn in the compiler, misra,
               polyspace and others, we have uint!! */

  return stack_array[0];
}

uint8_t global_array_100[100] = {1};
uint8_t global_array_256[256] = {1};
uint8_t global_array_500[500] = {1};

uint8_t stack_read_100_uint8_t(uint8_t arg) {
  uint32_t stack_array[100] = {1};

  return stack_array[arg]; /* this should orange-warn in polyspace and this
                              should pass in executable tools. */
}

uint8_t stack_read_100_uint32(uint32_t arg) {
  uint32_t stack_array[100] = {1};

  return stack_array[arg]; /* this should orange-warn in polyspace and this
                              should pass in executable tools. */
}

uint8_t stack_read_256_uint8_t(uint8_t arg) {
  uint32_t stack_array[256] = {1};

  return stack_array[arg]; /* this should orange-warn in polyspace and this
                              should pass in executable tools. */
}

uint8_t stack_read_256_uint32(uint32_t arg) {
  uint32_t stack_array[256] = {1};

  return stack_array[arg]; /* this should orange-warn in polyspace and this
                              should pass in executable tools. */
}

uint8_t stack_read_500_uint8_t(uint8_t arg) {
  uint32_t stack_array[500] = {1};

  return stack_array[arg]; /* this should orange-warn in polyspace and this
                              should pass in executable tools. */
}

uint8_t stack_read_500_uint32(uint32_t arg) {
  uint32_t stack_array[500] = {1};

  return stack_array[arg]; /* this should orange-warn in polyspace and this
                              should pass in executable tools. */
}

uint8_t stack_read_shift_100_uint8_t(uint8_t arg) {
  uint32_t stack_array[100] = {1};

  return stack_array[arg + 100]; /* this should red-warn in polyspace and this
                                    should pass in executable tools. */
}

uint8_t stack_read_shift_100_uint32(uint32_t arg) {
  uint32_t stack_array[100] = {1};

  return stack_array[arg + 100]; /* this should orange-warn in polyspace and
                                    this should pass in executable tools. */
}

uint8_t stack_read_shift_256_uint8_t(uint8_t arg) {
  uint32_t stack_array[256] = {1};

  return stack_array[arg + 100]; /* this should orange-warn in polyspace and
                                    this should pass in executable tools. */
}

uint8_t stack_read_shift_256_uint32(uint32_t arg) {
  uint32_t stack_array[256] = {1};

  return stack_array[arg + 100]; /* this should orange-warn in polyspace and
                                    this should pass in executable tools. */
}

uint8_t stack_read_shift_500_uint8_t(uint8_t arg) {
  uint32_t stack_array[500] = {1};

  return stack_array[arg + 100]; /* this should orange-warn in polyspace and
                                    this should pass in executable tools. */
}

uint8_t stack_read_shift_500_uint32(uint32_t arg) {
  uint32_t stack_array[500] = {1};

  return stack_array[arg + 100]; /* this should orange-warn in polyspace and
                                    this should pass in executable tools. */
}

uint8_t global_read_100_uint8_t(uint8_t arg) {
  return global_array_100
      [arg]; /* this should orange-warn in polyspace and this should pass in
                executable tools. */
}

uint8_t global_read_100_uint32(uint32_t arg) {
  return global_array_100
      [arg]; /* this should orange-warn in polyspace and this should pass in
                executable tools. */
}

uint8_t global_read_256_uint8_t(uint8_t arg) {
  return global_array_256[arg]; /* SAFE */
}

uint8_t global_read_256_uint32(uint32_t arg) {
  return global_array_256
      [arg]; /* this should orange-warn in polyspace and this should pass in
                executable tools. */
}

uint8_t global_read_500_uint8_t(uint8_t arg) {
  return global_array_500[arg]; /* SAFE */
}

uint8_t global_read_500_uint32(uint32_t arg) {
  return global_array_500
      [arg]; /* this should orange-warn in polyspace and this should pass in
                executable tools. */
}

uint8_t global_read_shift_100_uint8_t(uint8_t arg) {
  return global_array_100[arg + 100]; /* this should red-warn in polyspace and
                                         this should pass in executable tools.
                                         */
}

uint8_t global_read_shift_100_uint32(uint32_t arg) {
  return global_array_100[arg + 100]; /* this should orange-warn in polyspace
                                         and this should pass in executable
                                         tools. */
}

uint8_t global_read_shift_256_uint8_t(uint8_t arg) {
  return global_array_256[arg + 100]; /* this should orange-warn in polyspace
                                         and this should pass in executable
                                         tools. */
}

uint8_t global_read_shift_256_uint32(uint32_t arg) {
  return global_array_256[arg + 100]; /* this should orange-warn in polyspace
                                         and this should pass in executable
                                         tools. */
}

uint8_t global_read_shift_500_uint8_t(uint8_t arg) {
  return global_array_500[arg + 100]; /* SAFE */
}

uint8_t global_read_shift_500_uint32(uint32_t arg) {
  return global_array_500[arg + 100]; /* this should orange-warn in polyspace
                                         and this should pass in executable
                                         tools. */
}

int main(int runtime_1_int, char* argv[]) { (void) argv;
  int res = 0;
  int arg = runtime_1_int - 1;

  wrong_init();

  res += stack_read_100_uint8_t(arg);
  res += stack_read_100_uint32(arg);
  res += stack_read_256_uint8_t(arg);
  res += stack_read_256_uint32(arg);
  res += stack_read_500_uint8_t(arg);
  res += stack_read_500_uint32(arg);
  res += stack_read_shift_100_uint8_t(arg);
  res += stack_read_shift_100_uint32(arg);
  res += stack_read_shift_256_uint8_t(arg);
  res += stack_read_shift_256_uint32(arg);
  res += stack_read_shift_500_uint8_t(arg);
  res += stack_read_shift_500_uint32(arg);
  res += global_read_100_uint8_t(arg);
  res += global_read_100_uint32(arg);
  res += global_read_256_uint8_t(arg);
  res += global_read_256_uint32(arg);
  res += global_read_500_uint8_t(arg);
  res += global_read_500_uint32(arg);
  res += global_read_shift_100_uint8_t(arg);
  res += global_read_shift_100_uint32(arg);
  res += global_read_shift_256_uint8_t(arg);
  res += global_read_shift_256_uint32(arg);
  res += global_read_shift_500_uint8_t(arg);
  res += global_read_shift_500_uint32(arg);

  return res;
}
