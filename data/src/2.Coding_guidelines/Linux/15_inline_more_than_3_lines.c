/* Copyright 2018 Exida */
 
#include <stdio.h>

inline int f(void)
{
    return 3;
}

inline int f1(void)
{
    int a=7;
    return ++a;
}

int f(void);
int f1(void);

inline int f2(void) /* ERROR_LINE*/
{
   int a = 12;
   int b = f();
   int c = f1();
   return a+b+c;
}

int f2(void);
 
int main(int argc, char* argv[]) 
{
  (void) argv;
  return argc + f() + f1() + f2(); /* ERROR_FUNC */
}
