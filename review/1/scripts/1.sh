#!/bin/sh

str=$1
shift

find "$@" -name "*$str*"
