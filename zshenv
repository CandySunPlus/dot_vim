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

# export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/protobuf@3.6/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/protobuf@3.6/include"
# export PKG_CONFIG_PATH="/usr/local/opt/protobuf@3.6/lib/pkgconfig:$PKG_CONFIG_PATH"

path=(
    $HOME/.cargo/bin
    $HOME/.yarn/bin
    $HOME/.opt/bin
    $HOME/.go/bin
    $HOME/.dotnet/tools
    $HOME/.pub-cache/bin
    /usr/local/Caskroom/flutter/1.20.2/flutter/.pub-cache/bin
    /usr/local/lib/ruby/gems/2.7.0/bin
    /usr/local/opt/{llvm,ruby}/bin
    /usr/local/opt/go/libexec/bin
    /usr/local/{bin,sbin}
    /usr/local/opt/protobuf@3.6/bin
    $path
)


#
# Homebrew
#
export HOMEBREW_GITHUB_API_TOKEN="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"

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

. "$HOME/.cargo/env"
