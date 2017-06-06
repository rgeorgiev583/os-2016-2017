#!/bin/bash

if [[ $# -lt 2 ]]
then
    echo Wrong param. count
    exit 1
fi

ext="${1}"

homedir=~/files."${ext}"
mkdir "${homedir}"

while [[ $# -ge 2 ]]
do
    for file in $(find "${2}" -name \*.c)
    do
        if [[ -f "${file}" && -r "${file}" ]]
        then
            cp "${file}" "${homedir}"
        fi
    done
    shift
done
