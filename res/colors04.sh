#!/bin/bash
for i in {0..255}; do
    echo -en "\e[48;5;${i}m  \e[0m\e[38;5;${i}mcolour$(printf '%03d' $i)\e[0m  "
    [ $(((i+1)%6)) -eq 4 ] && echo
done
