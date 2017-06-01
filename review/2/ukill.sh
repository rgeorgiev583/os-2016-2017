#!/bin/bash

if [ $# -lt 1 ] || [ $1 = -n ] && [ $# -lt 3 ]
then
    echo error: not enough arguments 1>&2
    exit 1
fi

if [ $1 = -n ]
then
    for user in "${@:3}"
    do
        kill $(ps aux | grep ^$user | grep $2 | awk '{ print $2 }')
    done
else
    for user in "$@"
    do
        kill $(ps aux | grep ^$user | awk '{ print $2 }')
    done
fi
