#!/bin/bash

WORKINGDIR="$HOME/Documents/current"
MAP="$HOME/.config/rofi/subjects.csv"

cat "$MAP" \
    | cut -d ',' -f 1 \
    | rofi -dmenu -p "Choose Subject" \
    | head -n 1 \
    | xargs -i -o --no-run-if-empty grep "{}" "$MAP" \
    | cut -d ',' -f 2 \
    | head -n 1 \
    | xargs -i -o --no-run-if-empty /bin/bash -c "{}"

exit 0
