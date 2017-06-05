#!/bin/sh

sum=0

for arg
do
    sum=$((sum + $arg))
done

echo $sum
