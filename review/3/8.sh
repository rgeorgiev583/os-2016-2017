#!/bin/sh

n=$1
user=$2

while ! { who | grep "$user" > /dev/null 2>&1; }
do
    echo "waiting for $user to log in..."
    sleep $n
done

echo "$user is logged in now"
