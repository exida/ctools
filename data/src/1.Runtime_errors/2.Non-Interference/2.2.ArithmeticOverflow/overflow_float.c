/* Copyright Exida */

#include "Std_Types.h"

#include "float.h"

float big_plus_big(void) /* ERROR_FUNC */
{
  return FLT_MAX + FLT_MAX; /* ERROR_LINE */
}

float big_times_big(void) /* ERROR_FUNC */
{
  return FLT_MAX * FLT_MAX; /* ERROR_LINE */
}

float small_divided_by_big(void) /* ERROR_FUNC */
{
  return FLT_MIN / FLT_MAX; /* ERROR_LINE */
}

int main() {
  big_plus_big(); /* ERROR_FUNC */
  big_times_big(); /* ERROR_FUNC */
  small_divided_by_big(); /* ERROR_FUNC */

  return 0;
}
