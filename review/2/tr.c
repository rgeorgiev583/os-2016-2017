#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>

#define BUFSIZE 1000

int main(int argc, char** argv)
{
    if (argc < 3)
    {
        fprintf(stderr, "error: not enough arguments\n");
        return 1;
    }

    bool do_count = false, do_pos = false;
    size_t argpos = 1;

    while (argv[argpos] && *argv[argpos] == '-')
    {
        if (!strcmp(argv[argpos], "-s"))
            do_count = true;
        else if (!strcmp(argv[argpos], "-v"))
            do_pos = true;

        argpos++;
    }

    const char *set = argv[argpos], *subst_set = argv[argpos + 1];

    if (!set || !subst_set)
    {
        fprintf(stderr, "error: not enough arguments\n");
        return 1;
    }

    size_t set_len = strlen(set), count = 0, pos = 0;
    size_t* counts = calloc(set_len, sizeof(size_t));
    char buf[BUFSIZE];
    ssize_t len;

    while (len = read(0, buf, BUFSIZE))
    {
        for (size_t i = 0; i < len; i++)
        {
            for (size_t j = 0; j < set_len; j++)
                if (buf[i] == set[j])
                {
                    buf[i] = subst_set[j];
                    counts[j]++;

                    if (do_pos)
                        fprintf(stderr, "%u %c %c\n", pos, set[j], buf[i]);

                    break;
                }

            pos++;
        }

        write(1, buf, len);

        if (do_count)
            for (size_t i = 0; i < set_len; i++)
                fprintf(stderr, "%u %c\n", counts[i], set[i]);
    }

    free(counts);
    return 0;
}
