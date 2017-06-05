#!/bin/sh

min=$1
shift

for arg
do
    if [ $arg -lt $min ]
    then
        min=$arg
    fi
done

echo $min
