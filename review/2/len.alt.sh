#!/bin/bash

if [ $# -lt 1 ] || [ $1 = -s ] && [ $# -lt 2 ]
then
    echo error: not enough arguments 1>&2
    exit 1
fi

if [ $1 = -s ]
then
    shift
    ext=$1
    shift
    total=0

    for filename in $(find "$@" -name "*.$ext" -type f)
    do
        total=$(($total + $(wc -c < $filename)))
    done

    echo $total
else
    ext=$1
    shift

    for filename in $(find "$@" -name "*.$ext" -type f)
    do
        wc -c < $filename
    done
fi
