#!/bin/bash

RCFILE=~/.bashrc

# tmux setup
cp ./res/.tmux.conf ~/
cp -r ./res/.tmux ~/
# TODO: check if tpm repo exists
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# setup aliases and variables
cp ./res/.bash_aliases ~/
cp ./res/.bash_env_var ~/

echo "
# Additional env vars definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Additional env vars definitions.
if [ -f ~/.bash_env_var ]; then
    . ~/.bash_env_var
fi
" >> $RCFILE


# setup bash_prompt shell plugin
cat ./bash_git >> ${RCFILE}


# create tempporary directory at $HOME
mkdir -p {HOME}/tmp
