#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

#define BUFSIZE 1000

size_t fgetcount(int fd, char ch)
{
    static char buf[BUFSIZE];
    size_t count = 0;
    ssize_t len;

    while (len = read(fd, buf, BUFSIZE))
        for (size_t i = 0; i < len; i++)
            if (buf[i] == ch)
                count++;

    return count;
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "error: not enough arguments\n");
        return 1;
    }

    const char ch = *argv[1];

    if (argc < 3)
    {
        printf("%u\n", fgetcount(0, ch));
        return 0;
    }

    for (size_t i = 1; i < argc; i++)
        if (!fork())
        {
            int fd = open(argv[i], O_RDONLY);
            printf("%u %s\n", fgetcount(fd, ch), argv[i]);
            close(fd);
            exit(0);
        }

    int status;

    for (size_t i = 1; i < argc; i++)
        wait(&status);

    return 0;
}
