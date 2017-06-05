#!/bin/sh

src_ext=$1
dest_ext=$2
shift 2

for dir
do
    for file in "$dir"/*.$src_ext
    do
        mv "$file" "${file%$src_ext}$dest_ext"
    done
done
