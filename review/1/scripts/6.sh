#!/bin/sh

n=0

for file
do
    while read -r line
    do
        n=$((n + 1))
        echo $n. "$line"
    done < "$file"
done
