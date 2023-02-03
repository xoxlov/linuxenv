#!/bin/bash

RCFILE=~/.bashrc

echo " " >> ${RCFILE}
sed -i "s/^alias l='ls -CF'/# alias l='ls -CF'/" ${RCFILE}
cat ./alias >> ${RCFILE}
echo "" >> ${RCFILE}

cat ./bash_git >> ${RCFILE}

