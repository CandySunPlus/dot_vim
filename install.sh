#!/bin/bash
BASE_PATH=$(cd "$(dirname "$0")"; pwd)
rm -f ~/.vimrc ~/.gvimrc ~/.tmux.conf ~/.zshrc ~/.zshenv
ln -s ${BASE_PATH}/coc-settings.json ~/.vim/coc-settings.json
ln -s ${BASE_PATH}/vimrc ~/.vimrc
ln -s ${BASE_PATH}/gvimrc ~/.gvimrc
ln -s ${BASE_PATH}/tern-config ~/.tern-config
ln -s ${BASE_PATH}/editorconfig ~/.editorconfig
ln -s ${BASE_PATH}/agignore ~/.agignore
ln -s ${BASE_PATH}/prettierrc ~/.prettierrc
ln -s ${BASE_PATH}/zshrc ~/.zshrc
ln -s ${BASE_PATH}/zshenv ~/.zshenv
ln -s ${BASE_PATH}/p10k ~/.p10k
ln -s ${BASE_PATH}/tmux.conf ~/.tmux.conf
