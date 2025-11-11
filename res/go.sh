#!/bin/bash

readarray -t ALIAS < ./alias
echo ${#ALIAS[@]} # size of $ALIAS

for item in "${ALIAS[@]}"; do
    res=$(grep "${item}" ~/.bashrc -q; echo $?)
    if [ $res -ne 0 ]
    then
        echo $item
        echo "${item}" >> ~/.bashrc
    fi
done

