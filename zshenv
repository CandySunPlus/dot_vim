#
# Defines environment variables.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.

export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/protobuf@3.6/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/protobuf@3.6/include"
export PKG_CONFIG_PATH="/usr/local/opt/protobuf@3.6/lib/pkgconfig:$PKG_CONFIG_PATH"

path=(
    $HOME/.cargo/bin
    $HOME/.yarn/bin
    $HOME/.opt/bin
    $HOME/.go/bin
    $HOME/.pub-cache/bin
    /usr/local/lib/ruby/gems/2.5.0/bin
    /usr/local/opt/llvm/bin
    /usr/local/opt/go/libexec/bin
    /usr/local/{bin,sbin}
    /usr/local/opt/protobuf@3.6/bin
    $path
)


#
# Homebrew
#
export HOMEBREW_GITHUB_API_TOKEN="99c07e375a5f12a453b7de071381d324e42aed77"

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

