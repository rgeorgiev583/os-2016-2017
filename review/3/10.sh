#!/bin/sh

for file
do
    while read -r line
    do
        echo "$line"
        echo
    done < "$file"
done
