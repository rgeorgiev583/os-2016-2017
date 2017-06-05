#!/bin/sh

[ -d ~/.trash ] || mkdir ~/.trash

count=$(ls -l ~/.trash | wc -l)
rm_count=$((count / 4))
if [ $rm_count -eq $count ]
then
    rm $(ls -tr | head -$rm_count)
fi

for file
do
    mv "$file" ~/.trash
done
