#!/bin/bash

SESSION_NAME="xoxlov"

function searchDownloads() {
  DOWNLOADS="/home/${USER}"
  if [[ -x "/home/${USER}/Загрузки" ]]; then
    DOWNLOADS="/home/${USER}/Загрузки"
  elif [[ -x "/home/${USER}/Downloads" ]]; then
    DOWNLOADS="/home/${USER}/Downloads"
  fi
  export DOWNLOADS=${DOWNLOADS}
}
searchDownloads

tmux new-session -s ${SESSION_NAME}   -n admin -d  'cd /home/${USER}/tmp; bash -i'
tmux new-window  -t ${SESSION_NAME}:1 -n home      'cd /home/${USER}; bash -i'
tmux new-window  -t ${SESSION_NAME}:2 -n work      'cd /home/${USER}/work; bash -i'
tmux new-window  -t ${SESSION_NAME}:3 -n download  'cd ${DOWNLOADS}; bash -i'
tmux new-window  -t ${SESSION_NAME}:4 -n work-zsh  'cd /home/${USER}/work; zsh -i'
tmux new-window  -t ${SESSION_NAME}:5 -n work-fish 'cd /home/${USER}/work; fish -i'
#tmux new-window  -t ${SESSION_NAME}:6 -n process   'bash -c "htop --readonly"'

# https://github.com/samoshkin/tmux-config/blob/master/tmux/tmux.conf
tmux select-window -t ${SESSION_NAME}:1
tmux -2 attach-session -t ${SESSION_NAME}
