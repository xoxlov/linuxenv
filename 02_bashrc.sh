#!/bin/bash

RCFILE=~/.bashrc

# tmux setup
cp ./res/.tmux.conf ~/
cp -r ./res/.tmux ~/
# TODO: check if tpm repo exists
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# small fix to get rid of 'Receiving error 127 while installing'
# https://github.com/tmux-plugins/tpm/issues/17#issuecomment-68501952
sed -i '1s/\r//' ~/.tmux/plugins/tpm/tpm


# TODO: удалить из основного bashrc все алиасы
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
cat ./res/bash_git >> ${RCFILE}


# create temporary directory at $HOME
mkdir -p ${HOME}/tmp
