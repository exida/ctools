#include <stdlib.h>

void* kmalloc (size_t size)
{
    return malloc(size);
}

void kfree(void* objp)
{
    free(objp);
}

struct A
{
    int a;
    unsigned int b;
    char* p;
};

int main(int argc, char* argv[])
{
    struct A* ptr = kmalloc(sizeof(int) + sizeof(unsigned int) + sizeof(char*)); /* ERROR_LINE */
    kfree(ptr);
    (void) argc; (void) argv;
    return 0;
}

