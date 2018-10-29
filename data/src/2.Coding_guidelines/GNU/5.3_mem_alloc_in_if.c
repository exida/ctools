#include <stdlib.h>

struct A
{
    int a;
    unsigned int b;
    char* p;
};

int main(int argc, char* argv[])
{
    struct A* ptr = NULL;
    if ((ptr = malloc(sizeof(*ptr))) == NULL) /* ERROR_LINE */
    {
        return -1;
    }
    free(ptr);
    (void) argc;(void) argv;
    return 0;
}

