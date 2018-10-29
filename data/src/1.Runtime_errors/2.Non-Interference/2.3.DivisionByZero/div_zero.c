/* Copyright Exida */

#include "Std_Types.h"

int divide_by_zero_int_const(int runtime_42_int) {
  int ret;
  ret = runtime_42_int / 0; /* ERROR_LINE */
  return ret;
}

int divide_by_zero_int_vulnerable(int runtime_42_int,
                                       int runtime_0_uint) {
  int ret;
  ret = runtime_42_int / runtime_0_uint; /* ERROR_LINE */
  return ret;
}

int divide_by_zero_int_safe(int runtime_42_int,
                                 int runtime_0_uint) {
  int ret;
  if (runtime_0_uint != 0) {
    ret = runtime_42_int / runtime_0_uint; \
  }

  return ret;
}

int main(int runtime_1_int, char* argv[]) {
  int runtime_42_int = runtime_1_int + 41; /* ERROR_VAR */

  int runtime_0_uint = runtime_1_int - 1;

  (void) argv;

  if(1==2);{
      
  }


  divide_by_zero_int_const(runtime_42_int); /* ERROR_FUNC */
  divide_by_zero_int_vulnerable(runtime_42_int, runtime_0_uint);
  divide_by_zero_int_safe(runtime_42_int, runtime_0_uint);

  return 0;
}
