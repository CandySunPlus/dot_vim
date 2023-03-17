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

export EDITOR='lvim'
export VISUAL='lvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Android
#
export ANDROID_NDK_HOME='/Users/niksun/.android/ndk'

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
#
LDFLAGS=(
  -L/usr/local/opt/openssl@3/lib
  -L/usr/local/opt/ruby/lib
  -L/usr/local/opt/ncurses/lib
  $LDFLAGS
)
CPPFLAGS=(
  -I/usr/local/opt/openssl@3/include
  -I/usr/local/opt/ruby/include
  -I/usr/local/opt/ncurses/include
  $CPPFLAGS
)
PKG_CONFIG_PATH=(
  /usr/local/opt/ncurses/lib/pkgconfig
  /usr/local/opt/openssl@3/lib/pkgconfig
  /usr/local/opt/ruby/lib/pkgconfig
  $PKG_CONFIG_PATH
)

path=(
  $HOME/.r2env/bin
  $HOME/.cargo/bin
  $HOME/.android/emulator
  $HOME/.yarn/bin
  $HOME/.opt/bin
  $HOME/.local/bin
  $HOME/.local/share/nvim/mason/bin
  $HOME/.go/bin
  $HOME/.dotnet/tools
  $HOME/.emacs.d/bin
  $HOME/.pub-cache/bin
  /usr/local/Caskroom/flutter/1.20.2/flutter/.pub-cache/bin
  /usr/local/opt/{llvm,ruby,cpio,ruby}/bin
  /usr/local/opt/go/libexec/bin
  $HOME/.android/cmdline-tools/latest/bin
  /usr/local/{bin,sbin}
  $path
)



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
