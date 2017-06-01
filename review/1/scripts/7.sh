#!/bin/sh

self=$0

for file
do
    cp "$self" "$file"
    chmod +x "$file"
done
