#!/bin/bash

if [[ $# -lt 2 ]]
then
    echo Wrong param. count
    exit 1
fi

for index in $(seq 2 $#)
do
    if [[ ! -d "${!index}" ]]
    then
        echo Params. are not dirs
        exit 2
    fi
done

ext="${1}"

homedir=~/files."${ext}"
mkdir "${homedir}"

while [[ $# -ge 2 ]]
do
    for file in $(find "${2}" -name \*."${ext}")
    do
        if [[ -f "${file}" && -r "${file}" ]]
        then
            cp "${file}" "${homedir}"
        fi
    done
    shift
done

exit 0
