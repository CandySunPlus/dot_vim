#!/bin/bash
BASE_PATH=$(cd "$(dirname "$0")"; pwd)
rm -f ~/.vimrc ~/.gvimrc ~/.tmux.conf
ln -s ${BASE_PATH}/vimrc ~/.vimrc
ln -s ${BASE_PATH}/gvimrc ~/.gvimrc
ln -s ${BASE_PATH}/tmux.conf ~/.tmux.conf
