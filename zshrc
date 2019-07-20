# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/niksun/.oh-my-zsh"

ZLE_RPROMPT_INDENT=0
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.p10k

ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# common
export XDG_CONFIG_HOME=~/.config
export CURL_CA_BUNDLE=/etc/ssl/cert.pem
export GOPATH="/Users/niksun/development/golang"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# for python virtualenv wrapper
export WORKON_HOME=~/.opt/envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# for nodejs
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
export SASS_BINARY_SITE=https://npm.taobao.org/mirrors/node-sass
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for drone
export DRONE_SERVER=https://drone.wehaowu.com
export DRONE_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0Ijoic3VuZmVuZ21pbmciLCJ0eXBlIjoidXNlciJ9.upYOCG8lrx1cNb7-FTG_zNyHjaW0hQcookLplEARJxM

# for flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# for proxy
alias proxy="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087"
alias unproxy="unset http_proxy;unset https_proxy"
