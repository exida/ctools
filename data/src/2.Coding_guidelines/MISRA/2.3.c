
int function(void) { /* ERROR_FUNC */
  typedef unsigned int UINT; /* ERROR_LINE */
  return 1;
}

int main(void)
{
  return function(); /* ERROR_FUNC */
}
