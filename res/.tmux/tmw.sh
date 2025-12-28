#!/bin/bash

SESSION_NAME="work"

mkdir -p ${HOME}/tmp
mkdir -p ${HOME}/distrs

tmux new-session -s ${SESSION_NAME}   -n admin -d   'cd ${HOME}/tmp; bash -i'
tmux new-window  -t ${SESSION_NAME}:1 -n qemu       'cd ${HOME}/distrs; bash -i'
tmux new-window  -t ${SESSION_NAME}:2 -n Corp-FWaaS 'cd ${HOME}/Corp-FWaaS; bash -i'
tmux new-window  -t ${SESSION_NAME}:3 -n distrs     'cd ${HOME}/distrs; bash -i'
tmux new-window  -t ${SESSION_NAME}:4 -n distrs     'cd ${HOME}/distrs; bash -i'
tmux new-window  -t ${SESSION_NAME}:5 -n docker     'cd ${HOME}/distrs/docker; bash -i'

# https://github.com/samoshkin/tmux-config/blob/master/tmux/tmux.conf
tmux select-window -t ${SESSION_NAME}:1
tmux -2 attach-session -t ${SESSION_NAME}
