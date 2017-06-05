#!/bin/sh

for file
do
    while read -r line
    do
        if [ ${#line} -gt ${#max_line} ]
        then
            max_line=$line
        fi
    done < "$file"
done

echo "$max_line"
