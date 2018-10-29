#include <stddef.h>

int too_many_func_statements(int a) /* ERROR_LINE */
{
    size_t id;
    for (id=0; id < 12; ++id)
    {
        ++a;
    }
    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }

    for (id=0; id < 12; ++id)
    {
        ++a;
    }
    for (id=0; id < 12; ++id)
    {
        ++a;
    }
    for (id=0; id < 12; ++id)
    {
        ++a;
    }
    return a;
}

int main(int argc, char* argv[])
{
    (void) argv;
    return too_many_func_statements(argc); /* ERROR_FUNC */
}

