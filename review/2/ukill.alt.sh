#!/bin/bash

if [ $# -lt 1 ] || [ $1 = -n ] && [ $# -lt 3 ]
then
    echo error: not enough arguments 1>&2
    exit 1
fi

if [ $1 = -n ]
then
    shift
    name=$1
    shift

    for user
    do
        kill $(ps aux | grep ^$user | grep $name | awk '{ print $2 }')
    done
else
    for user
    do
        kill $(ps aux | grep ^$user | awk '{ print $2 }')
    done
fi
