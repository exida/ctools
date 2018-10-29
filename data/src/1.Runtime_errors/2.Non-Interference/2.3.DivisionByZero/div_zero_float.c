/* Copyright Exida */

#include "Std_Types.h"
#include <math.h>

double divide_by_zero_double_const(double runtime_42_double) {
  double ret;

  ret = runtime_42_double / 0.0f; /* ERROR_LINE */

  return ret;
}

double divide_by_zero_double_vulnerable(double runtime_42_double,
                                      double runtime_0_double) {
  double ret;

  ret = runtime_42_double / runtime_0_double; /* ERROR_LINE */

  return ret;
}

double divide_by_zero_double_safe(double runtime_42_double, double runtime_0_double) {
  double ret;

  if (FP_ZERO != fpclassify(runtime_0_double))  {
    ret = runtime_42_double / runtime_0_double;
  }

  return ret;
}

int main(int runtime_1_int, char* argv[]) { (void) argv;
  double runtime_42_double = (double)runtime_1_int + 41.0f;

  int runtime_0_uint = runtime_1_int - 1; /* ERROR_VAR */
  double runtime_0_double = (double)runtime_0_uint; /* ERROR_VAR */

  divide_by_zero_double_const(runtime_42_double); /* ERROR_FUNC */
  divide_by_zero_double_vulnerable(runtime_42_double, runtime_0_double);/* ERROR_FUNC */
  divide_by_zero_double_safe(runtime_42_double, runtime_0_double);/* ERROR_FUNC */

  return 0;
}
