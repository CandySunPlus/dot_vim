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

# for proxy
function proxy {
  PHOST=${PHOST:=127.0.0.1}
  export https_proxy=http://$PHOST:7890
  export http_proxy=http://$PHOST:7890
  export all_proxy=socks5://$PHOST:7890
}

alias unproxy="unset http_proxy; unset https_proxy; unset all_proxy;"
alias ls="eza"
alias kssh="kitty +kitten ssh"
alias aws="aws --endpoint-url https://s3plus.vip.sankuai.com"
alias mnpm="npm --registry=http://r.npm.sankuai.com \
--cache=$HOME/.cache/mnpm \
--disturl=http://npm.sankuai.com/mirrors/node \
--userconfig=$HOME/.mnpmrc"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<


# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/Applications/kitty.app/Contents/Resources/kitty/shell-integration/kitty.zsh"; then source "/Applications/kitty.app/Contents/Resources/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION
