if [[ $(uname) == "Darwin" ]]; then
  ulimit -S -n 1024
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias tar="COPYFILE_DISABLE=1 tar"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-vi-mode direnv rye)
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME=~/.config
export CURL_CA_BUNDLE=/etc/ssl/cert.pem
export GOPATH="$HOME/.go"

# for rustup use rsproxy
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# for proxy
function proxy {
  PHOST=${PHOST:=127.0.0.1}
  export https_proxy=http://$PHOST:7890
  export http_proxy=http://$PHOST:7890
  export all_proxy=socks5://$PHOST:7890
  export no_proxy=localhost,127.0.0.1,$PHOST
}

alias unproxy="unset http_proxy; unset https_proxy; unset all_proxy;"
alias ls="eza"
alias aws="aws --endpoint-url https://s3plus.vip.sankuai.com"
alias mnpm="npm --registry=http://r.npm.sankuai.com \
--cache=$HOME/.cache/mnpm \
--disturl=http://npm.sankuai.com/mirrors/node \
--userconfig=$HOME/.mnpmrc"
alias enp="enpass-cli -vault=$(realpath ~)/Documents/Enpass/Vaults/primary -sort"

if [[ $(uname) != "Darwin" ]]; then
  alias docker="podman"
fi

eval "$(jenv init -)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(starship init zsh)"
eval "$(cat $HOME/.rye/env)"
fastfetch



# pnpm
export PNPM_HOME="/Users/niksun/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end




source ~/.moaextrc
