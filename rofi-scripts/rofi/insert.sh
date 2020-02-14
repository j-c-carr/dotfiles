#!/bin/bash
file="$1"
line="$2"
newText="$3"

sed -i -e "/$line/i $newText" $file # insert file input
sed -i "s/$newText/\\$newText/" $file # insert \ at beginning
