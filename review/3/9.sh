#!/bin/sh

file=$1

if [ -e "$file" ]
then
    echo yes
else
    echo no
fi
