#!/bin/sh

for file
do
    read -r prev_line < "$file"
    echo "$prev_line"

    while read -r line
    do
        if [ "$line" != "$prev_line" ]
        then
            prev_line=$line
            echo "$line"
        fi
    done < "$file"
done
