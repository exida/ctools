int main(int argc, char* argv[])
{
    (void) argc; (void) argv;
    __asm__ ( "movl $10, %eax;"
              "movl $20, %ebx;"
              "addl %ebx, %eax;"
    );  

    __asm__ ( "movl $10, %eax; movl $20, %ebx; subl %ebx, %eax;"); /* ERROR_LINE */
    return 0;
}

