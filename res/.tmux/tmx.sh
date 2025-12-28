#!/bin/bash

SESSION_NAME="xoxlov"

function searchDownloads() {
  DOWNLOADS="${HOME}"
  if [[ -x "${HOME}/Загрузки" ]]; then
    DOWNLOADS="${HOME}/Загрузки"
  elif [[ -x "${HOME}/Downloads" ]]; then
    DOWNLOADS="${HOME}/Downloads"
  fi
  export DOWNLOADS=${DOWNLOADS}
}
searchDownloads

mkdir -p ${HOME}/tmp
mkdir -p ${HOME}/work

tmux new-session -s ${SESSION_NAME}   -n admin -d  'cd ${HOME}/tmp; bash -i'
tmux new-window  -t ${SESSION_NAME}:1 -n home      'cd ${HOME}; bash -i'
tmux new-window  -t ${SESSION_NAME}:2 -n work      'cd ${HOME}/work; bash -i'
tmux new-window  -t ${SESSION_NAME}:3 -n download  'cd ${DOWNLOADS}; bash -i'
#tmux new-window  -t ${SESSION_NAME}:4 -n work-zsh  'cd ${HOME}/work; zsh -i'
#tmux new-window  -t ${SESSION_NAME}:5 -n work-fish 'cd ${HOME}/work; fish -i'
#tmux new-window  -t ${SESSION_NAME}:6 -n process   'bash -c "htop --readonly"'

# https://github.com/samoshkin/tmux-config/blob/master/tmux/tmux.conf
tmux select-window -t ${SESSION_NAME}:1
tmux -2 attach-session -t ${SESSION_NAME}
