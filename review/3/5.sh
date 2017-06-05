#!/bin/sh

n=$1
shift

for dir
do
    ls -t $dir | head -$n
done
