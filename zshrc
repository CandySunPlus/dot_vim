# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
neofetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ $(uname) == "Darwin" ]]; then
  ulimit -S -n 1024
fi

grep -q microsoft /proc/version 2> /dev/null

if [ $? -eq 0 ] && [ -z "$TMUX" ]; then
  export TERM=ms-terminal
  alias tmux="TERM=xterm-256color tmux"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-vi-mode)
source $ZSH/oh-my-zsh.sh

# ZLE_RPROMPT_INDENT=0
# ZSH_HIGHLIGHT_STYLES[path]=none
# ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# common
export XDG_CONFIG_HOME=~/.config
export CURL_CA_BUNDLE=/etc/ssl/cert.pem
export GOPATH="$HOME/.go"
# export JAVA_HOME=$(/usr/libexec/java_home)
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottles

# for nodejs
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
export SASS_BINARY_SITE=https://npm.taobao.org/mirrors/node-sass

# for flutter
export PUB_HOSTED_URL=https://pub.sankuai.com
export FLUTTER_STORAGE_BASE_URL=https://mirrors.sjtug.sjtu.edu.cn

# for rustup
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# for nnn
export NNN_USE_EDITOR=1

# export DOCKER_HOST="ssh://LinuxLocal"
# for proxy

function proxy {
  PHOST=${PHOST:=127.0.0.1}
  export https_proxy=http://$PHOST:7890
  export http_proxy=http://$PHOST:7890
  export all_proxy=socks5://$PHOST:7890
}

alias unproxy="unset http_proxy; unset https_proxy; unset all_proxy;"
alias ls="exa"
alias kssh="kitty +kitten ssh"
alias aws="aws --endpoint-url https://s3plus.vip.sankuai.com"
# alias docker=podman

if [[ $(uname) != "Darwin" ]]; then
  alias docker="podman"
fi

# for python virtual ENV
if [ -s "/usr/local/bin/virtualenvwrapper.sh" ]; then
  export VIRTUALENVWRAPPER_PYTHON=`which python3`
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/development/python
  source /usr/local/bin/virtualenvwrapper.sh
fi


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"

alias luamake=/home/niksun/source/lua-language-server/3rd/luamake/luamake




# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<


# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/Applications/kitty.app/Contents/Resources/kitty/shell-integration/kitty.zsh"; then source "/Applications/kitty.app/Contents/Resources/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION

