#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
    read line
    kb_layout=$(xkblayout-state print %s)
    if [[ $line == ",[{"* ]]; then
        line=$(echo $line | sed "s/./&{\"name\":\"layout\",\"full_text\":\"$kb_layout\"},/2" )
    elif [[ $line == "[{"* ]]; then
        line=$(echo $line | sed "s/./&{\"name\":\"layout\",\"full_text\":\"$kb_layout\"},/1" )
    fi
    echo "$line" || exit 1
done
