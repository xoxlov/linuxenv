#!/bin/bash

RCFILE=~/.bashrc

echo " " >> ${RCFILE}
echo " " >> ${RCFILE}
cat ./alias >> ${RCFILE}
echo "" >> ${RCFILE}

cat ./bash_git >> ${RCFILE}

