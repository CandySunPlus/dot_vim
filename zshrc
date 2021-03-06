# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/niksun/.oh-my-zsh"

ZLE_RPROMPT_INDENT=0
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions zsh-syntax-highlighting vi-mode)

source $ZSH/oh-my-zsh.sh
source ~/.p10k

ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# common
export XDG_CONFIG_HOME=~/.config
export CURL_CA_BUNDLE=/etc/ssl/cert.pem
export GOPATH="$HOME/.go"
export JAVA_HOME=$(/usr/libexec/java_home)
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottles

# for nodejs
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
export SASS_BINARY_SITE=https://npm.taobao.org/mirrors/node-sass

# for drone
export DRONE_SERVER=https://cicd.wehaowu.com
export DRONE_TOKEN=55f24eb3d61ef6ac5e83d550178638dc

# for flutter
export PUB_HOSTED_URL=https://pub.sankuai.com
export FLUTTER_STORAGE_BASE_URL=https://mirrors.sjtug.sjtu.edu.cn

# for nnn
export NNN_USE_EDITOR=1

# for proxy
alias proxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias unproxy="unset http_proxy; unset https_proxy; unset all_proxy;"
alias ls="exa"
alias kssh="kitty +kitten ssh"

export DOCKER_HOST=ssh://Cloud

# for python virtual ENV
if [ -s "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python3`
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/development/python
    source /usr/local/bin/virtualenvwrapper.sh
fi

neofetch

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
