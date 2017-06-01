#!/bin/sh

char_src=$1
char_dest=$2
shift

for file
do
    while read -r line
    do
        line=${line//$char_src/$char_dest}
        echo "$line"
    done < "$file"
done
