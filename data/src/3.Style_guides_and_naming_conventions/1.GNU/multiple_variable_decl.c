int main(int argc, char* argv[])
{
    int foo,
        bar; /* ERROR_LINE */

    (void) argv;

    foo = argc;
    bar=foo+17;
    return foo+bar;
}
