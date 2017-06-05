#!/bin/sh

n=$1
shift

for file
do
    c=0
    while [ $c -lt $n ] && read -r line
    do
        echo "$line"
        c=$((c + 1))
    done < "$file"
done
