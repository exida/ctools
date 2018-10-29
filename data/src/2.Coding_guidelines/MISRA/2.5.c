
#define ONE 1
#define TWO 2 /* ERROR_LINE */

int function(void)
{
  return ONE;
}

int main(void)
{
  return function();
}
