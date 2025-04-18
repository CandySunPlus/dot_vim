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
# Android
#
export ANDROID_SDK_ROOT=$(realpath ~)'/Library/Android/sdk'
export ANDROID_NDK_HOME=$ANDROID_SDK_ROOT'/ndk'

#
# Paths
#

# typeset -gU cdpath fpath mailpath path
typeset -TxU LDFLAGS ldflags ' '
typeset -TxU CXXFLAGS cxxflags ' '
typeset -TxU CFLAGS cflags ' '
typeset -TxU PKG_CONFIG_PATH pkg_config_path


# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.

#
ldflags=(
  $ldflags
  -L/opt/homebrew/lib
)
cxxflags=(
  $cxxflags
)
cflags=(
  $cflags
  -I/opt/homebrew/include
)
pkg_config_path=(
  ~/.local/share/pkgconfig
  /opt/homebrew/lib/pkgconfig
  $pkg_config_path
)

path=(
  $HOME/.r2env/bin
  $HOME/.yarn/bin
  $HOME/.opt/bin
  $HOME/.local/bin
  $HOME/.cargo/bin
  $HOME/.go/bin
  $HOME/.dotnet/tools
  $HOME/.emacs.d/bin
  $HOME/.pub-cache/bin
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

export BAT_THEME="Catppuccin Mocha"

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

. "$HOME/.cargo/env"
