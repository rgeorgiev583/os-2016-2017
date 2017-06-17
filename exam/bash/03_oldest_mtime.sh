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

files_count="${1}"

homedir=~/files.$1
mkdir "${homedir}"
counter=1

while [[ $# -ge 2 ]]
do
    for file in $(ls -c "${2}" | tac)
    do
        if [[ $counter -gt $files_count ]]
        then
            break
        fi

        if [[ ! -f "${file}" ]]
        then
            continue
        fi

        cp "${file}" "${homedir}"
        counter=$((counter + 1))

    done

    counter=1
    shift
done
