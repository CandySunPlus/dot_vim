#!/bin/bash
BASE_PATH=$(cd "$(dirname "$0")"; pwd)
rm -f ~/.vimrc ~/.gvimrc ~/.tmux.conf ~/.ctags
mkdir -p ~/.vim/binary
tar xfv ctags-5.8.mountain_lion.bottle.tar.gz -C ~/.vim/binary
ln -s ~/.vim/binary/ctags/5.8/bin/ctags /usr/local/bin/ctags
ln -s ${BASE_PATH}/vimrc ~/.vimrc
ln -s ${BASE_PATH}/gvimrc ~/.gvimrc
ln -s ${BASE_PATH}/ctags ~/.ctags
ln -s ${BASE_PATH}/tmux.conf ~/.tmux.conf
