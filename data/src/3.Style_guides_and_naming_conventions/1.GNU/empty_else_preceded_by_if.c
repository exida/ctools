int main(int argc, char* argv[])
{
    int a=argc;
    (void) argv;
    if (a>3)
    {
        a*=8;
    }
    else /* ERROR_LINE */
    {
        if (a<6) /* ERROR_LINE */
        {
            a+=5;
        }
    }
    return a;
}
