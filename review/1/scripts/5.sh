#!/bin/sh

src=$1
[ -z "$src" ] && exit 1

dest=$2
[ -z "$dest" ] && exit 2

mv "$src" tmp
mv "$dest" "$src"
mv tmp "$dest"
