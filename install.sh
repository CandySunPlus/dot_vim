#!/bin/bash

BASE_PATH=$(cd "$(dirname "$0")" || exit; pwd)
mkdir -p ~/.vim
ln -sf "$BASE_PATH/coc-settings.json" ~/.vim/coc-settings.json
ln -sf "$BASE_PATH/gitconfig" ~/.gitconfig
ln -sf "$BASE_PATH/editorconfig" ~/.editorconfig
ln -sf "$BASE_PATH/agignore" ~/.agignore
ln -sf "$BASE_PATH/prettierrc" ~/.prettierrc
ln -sf "$BASE_PATH/zshenv" ~/.zshenv
ln -sf "$BASE_PATH/zshrc" ~/.zshrc
ln -sf "$BASE_PATH/p10k.zsh" ~/.p10k.zsh
ln -sf "$BASE_PATH/starship.toml" ~/.config/
ln -sf "$BASE_PATH/tmux.conf" ~/.tmux.conf
ln -sf "$BASE_PATH/kitty" ~/.config/
ln -sf "$BASE_PATH/lvim" ~/.config/
ln -sf "$BASE_PATH/zellij" ~/.config/
ln -sf "$BASE_PATH/cargo_config" ~/.cargo/config.toml
ln -sf "$BASE_PATH/clang-format" ~/.clang-format
ln -sf "$BASE_PATH/clang-tidy" ~/.clang-tidy
ln -sf "$BASE_PATH/clangd" ~/.clangd
ln -sf "$BASE_PATH/rustfmt.toml" ~/.rustfmt.toml
ln -sf "$BASE_PATH/nvim" ~/.config/
ln -sf "$BASE_PATH/lazygit.config.yml" ~/.config/lazygit/config.yml
ln -sf "$BASE_PATH/fastfetch.jsonc" ~/.config/fastfetch/config.jsonc
