int too_many_params(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9) /* ERROR_LINE */
{
    return a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9;
}

int main(int argc, char* argv[]) 
{
    (void) argv;
    return too_many_params(argc, argc, argc, 3, 4, 5, 8, argc, argc); /* ERROR_FUNC */
}
