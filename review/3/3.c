#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <fcntl.h>

#define BUF_SIZE 1000


void uniq(int fd)
{
    int c = 1;
    bool has_prev = false;
    char prev_buf[BUF_SIZE], buf[BUF_SIZE];
    int pos = 0;

    while (read(fd, &buf[pos], 1) > 0)
        if ('\n' == buf[pos])
        {
            if (!has_prev || strncmp(prev_buf, buf, pos + 1))
            {
                write(1, buf, pos + 1);
                strncpy(prev_buf, buf, pos + 1);
            }

            has_prev = true;
            pos = 0;
        }
        else
            pos++;
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        uniq(0);
        return 0;
    }

    for (int i = 1; i < argc; i++)
    {
        int fd = open(argv[i], O_RDONLY);
        uniq(fd);
    }

    return 0;
}

