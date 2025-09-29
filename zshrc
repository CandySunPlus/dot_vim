if [[ $(uname) == "Darwin" ]]; then
    ulimit -S -n 1024
    case ":$PATH:" in
        *":/opt/homebrew/bin:"*) ;;
        *) eval "$(/opt/homebrew/bin/brew shellenv)" ;;
    esac
alias tar="COPYFILE_DISABLE=1 tar"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-vi-mode direnv rye)
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME=~/.config
export CURL_CA_BUNDLE=/etc/ssl/cert.pem
export GOPATH="$HOME/.go"
export GOPROXY=https://goproxy.cn,direct
export GO111MODULE=on

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

case ":$PATH:" in
    *"$HOME/.jenv"*) ;;
    *) eval "$(jenv init -)" ;;
esac
case ":$PATH:" in
    *"fnm_multishells"*) ;;
    *) eval "$(fnm env --use-on-cd --shell zsh)" ;;
esac
eval "$(cat $HOME/.rye/env)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
fastfetch


# pnpm
export PNPM_HOME="$HOME/.pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source ~/.moaextrc

# bun completions
[ -s "/Users/niksun/.bun/_bun" ] && source "/Users/niksun/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
case ":$PATH:" in
    *":$BUN_INSTALL/bin:"*) ;;
    *) export PATH="$BUN_INSTALL/bin:$PATH" ;;
esac
