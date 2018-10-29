int check_limit(int a, int b)
{
    return (a+b) *7;
}

int main(int argc, char* argv[])
{
    int a=12;
    (void) argv;

    if (check_limit(a, argc) > 50) /* ERROR_LINE */
    {
        a=3;
    }
    else
    {
        a=3;
    }

    return a;
}

