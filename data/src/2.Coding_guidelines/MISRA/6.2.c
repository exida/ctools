struct S {
  signed int a : 1;   /* ERROR_LINE*/
  signed int : 1;     /* Unnamed - Compliant */
  unsigned int b : 1; /* Unsigned - Compliant */
};

int main(void)
{
  return 0;
}
