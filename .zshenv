# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Disable files
export LESSHISTFILE=-

# Fix dotfiles and dotdirs paths
export GEM_PATH="$XDG_DATA_HOME/ruby/gems"
export GEM_SPEC_CACHE="$XDG_DATA_HOME/ruby/specs"
export GEM_HOME="$XDG_DATA_HOME/ruby/gems"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GOPATH="$XDG_DATA_HOME"/go
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export WD_CONFIG=$XDG_CONFIG_HOME/.warprc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NVM_DIR="$XDG_DATA_HOME"/nvm

# Default programs
export EDITOR="nvim"
export READER="evince"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="eog"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="qtile"

# Other
export ARCHFLAGS="-arch x86_64"
export GPG_TTY=$(tty)
