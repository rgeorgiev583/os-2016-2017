#!/bin/sh

for file
do
    while read -r line
    do
        if [ "$line" != "" ]
        then
            echo "$line"
        fi
    done < "$file"
done
