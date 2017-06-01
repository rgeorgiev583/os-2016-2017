#!/bin/bash

if [ $# -lt 1 ] || [ $1 = -s ] && [ $# -lt 2 ]
then
    echo error: not enough arguments 1>&2
    exit 1
fi

if [ $1 = -s ]
then
    total=0

    for size in $(find "${@:3}" -name "*.$2" -type f -exec wc -c {} \; | cut -f1 -d' ')
    do
        total=$(($total + $size))
    done

    echo $total
else
    find "${@:2}" -name "*.$1" -type f -exec wc -c {} \; | cut -f1 -d' '
fi
