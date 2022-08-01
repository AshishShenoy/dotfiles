# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# PATH
export PATH="$XDG_DATA_HOME/go/bin:$PATH"
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
export PATH="$XDG_DATA_HOME/pnpm:$PATH"

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
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export PSQL_HISTORY="$XDG_DATA_HOME"/psql_history
export PNPM_HOME="$XDG_DATA_HOME"/pnpm
export ANDROID_HOME="$XDG_DATA_HOME"/android

# Default programs
export EDITOR="zsh -ic 'neovide --multigrid'"
export READER="evince"
export VISUAL="zsh -ic 'neovide --multigrid'"
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
