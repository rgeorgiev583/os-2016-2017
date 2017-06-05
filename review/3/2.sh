#!/bin/sh

user=$1
shift

for dir
do
    ls -l "$dir" | awk '{ print $3,$9 }' | grep ^$user | cut -d' ' -f2
done
