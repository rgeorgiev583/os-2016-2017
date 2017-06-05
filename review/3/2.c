#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>


void head(int fd, int n)
{
    int c = 1;
    char buf;

    while (read(fd, &buf, 1) > 0)
    {
        write(1, &buf, 1);

        if ('\n' == buf)
            if (c < n)
                c++;
            else
                break;
    }
}

int main(int argc, char** argv)
{
    if (argc < 2)
        return 1;

    int n = atoi(argv[1]);

    if (argc == 2)
    {
        head(0, n);
        return 0;
    }

    for (int i = 2; i < argc; i++)
    {
        int fd = open(argv[i], O_RDONLY);
        head(fd, n);
    }

    return 0;
}

