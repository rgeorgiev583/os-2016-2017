#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <libgen.h>

#define BUF_SIZE 1000


int main(int argc, char** argv)
{
    if (argc < 3)
        return 1;

    for (int i = 1; i < argc - 1; i++)
    {
        if (!fork())
        {
            int fdi = open(argv[i], O_RDONLY);
            char* dest_name;
            asprintf(&dest_name, "%s/%s", argv[argc - 1], basename(argv[i]));
            int fdo = creat(dest_name, 0644);
            char buf[BUF_SIZE];
            int n;

            while ((n = read(fdi, buf, BUF_SIZE)) > 0)
                write(fdo, buf, n);

            exit(0);
        }
    }

    for (int i = 1; i < argc - 1; i++)
    {
        int status;
        wait(&status);
    }

    return 0;
}
