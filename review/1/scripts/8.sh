#!/bin/sh

char=$1
shift

for file
do
    while read -r line
    do
        line=${line//$char/}
        echo "$line"
    done < "$file"
done
