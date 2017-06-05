/*
 * За да работи тази програма правилно, трябва да се изпълни по следния начин:
 * `stdbuf -i0 -o0 -e0 ./a.out <аргументи>`
 * където `a.out` е името на изпълнимия файл.
 */

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#define BUF_SIZE 1000


void nl(int fd, int* c)
{
    char buf;
    while (read(fd, &buf, 1) > 0)
    {
        write(1, &buf, 1);

        if ('\n' == buf)
        {
            (*c)++;
            printf("%d. ", *c);
        }
    }
}           

int main(int argc, char const* const* argv)
{
    int c = 1;
    printf("%d. ", c);

    if (argc <= 1)
    {
        nl(0, &c);
        return 0;
    }

    for (int i = 1; i < argc; i++)
    {
        int fd = open(argv[i], O_RDONLY);
        nl(fd, &c);
    }

    return 0;
}
