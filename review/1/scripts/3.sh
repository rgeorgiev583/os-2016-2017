#!/bin/sh

total=0

for dir
do
    sum=0

    for file in "$dir"/*
    do
        if [ -f $file ]
        then
            sum=$((sum + 1))
            total=$((total + 1))
        fi
    done

    echo $sum "$dir"
done

echo total: $total
