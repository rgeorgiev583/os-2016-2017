#!/bin/sh

max_len=0

for file
do
    len=$(wc -c < "$file")
    if [ $len -gt $max_len ]
    then
        max_len=$len
        max_file=$file
    fi
done

cat $max_file
