#!/bin/bash
count=0
for file in /etc/*
do
    if [[ ! -f "${file}" || ! -r "${file}" ]]
    then
        continue
    fi
    for char in $(cat "${file}" | cut -c 1 | tr -s '\n' ' ')
    do
        if [[ $char = '#' ]]
        then
            count=$((count + 1))
            break
        fi
    done
done
echo $count
