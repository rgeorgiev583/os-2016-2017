#!/bin/sh

n=$1
m=$2
shift 2

for dir
do
    for file in "$dir"/*
    do
        size=$(wc -c < "$file")
        if [ $size -ge $n ] && [ $size -le $m ]
        then
            echo "$file"
        fi
    done
done
