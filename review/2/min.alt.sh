#!/bin/bash

if [ $# -lt 1 ] || [ $1 = -l ] && [ $# -lt 2 ]
then
    echo error: not enough arguments 1>&2
    exit 1
fi

if [ $1 = -l ]
then
    shift
    min=$1
    shift

    find "$@" -type f -exec wc -c {} \; | cut -f1 -d' ' | sort -n | head -$min
else
    min=$1
    shift

    find "$@" -type f -exec wc -c {} \; | sort -n | head -$min
fi
