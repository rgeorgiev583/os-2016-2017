#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

bool do_count_chars, do_count_words, do_count_lines;

size_t fgetcounts(int fd, size_t* words, size_t* lines)
{
    char ch;
    size_t chars = 0;
    *words = 1;
    *lines = 1;

    while (read(fd, &ch, 1))
    {
        if (ch == '\n')
        {
            (*lines)++;
            (*words)++;
        }
        else if (ch == ' ')
            (*words)++;

        chars++;
    }

    return chars;
}

void fprintcounts(int fd, const char* filename)
{
    size_t lines, words, chars = fgetcounts(fd, &words, &lines);
    if (do_count_lines)
        printf(" %u", lines);
    if (do_count_words)
        printf(" %u", words);
    if (do_count_chars)
        printf(" %u", chars);
    if (filename)
        printf(" %s", filename);
    printf("\n");
}

int main(int argc, char** argv)
{
    do_count_chars = false;
    do_count_words = false;
    do_count_lines = false;
    size_t argpos = 1;

    while (argv[argpos] && *argv[argpos] == '-')
    {
        if (!strcmp(argv[argpos], "-c"))
            do_count_chars = true;
        else if (!strcmp(argv[argpos], "-w"))
            do_count_words = true;
        else if (!strcmp(argv[argpos], "-l"))
            do_count_lines = true;

        argpos++;
    }

    if (!do_count_chars && !do_count_words && !do_count_lines)
    {
         do_count_chars = true;
         do_count_words = true;
         do_count_lines = true;
    }

    if (argpos == argc)
    {
        fprintcounts(0, NULL);
        return 0;
    }

    for (size_t i = argpos; i < argc; i++)
        if (!fork())
        {
            int fd = open(argv[i], O_RDONLY);
            fprintcounts(fd, argv[i]);
            close(fd);
            exit(0);
        }

    int status;

    for (size_t i = 1; i < argc; i++)
        wait(&status);

    return 0;
}
