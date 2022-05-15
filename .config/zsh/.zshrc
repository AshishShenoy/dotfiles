# This config requires the following packages on Arch Linux (btw):
# zsh-syntax-highlighting
# zsh-autosuggestions
# fzf
# spaceship-prompt (AUR)
# zsh-plugin-wd-git (AUR)

# Setup case-insensitive menu-driven autocompletion of commands and subcommands
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit

# Make sure to not switch to vim mode instead of emacs mode.
bindkey -e 

# Setup Spaceship Prompt and options
autoload -U promptinit && promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  rust          # Rust section
  venv          # virtualenv section
  node          # Node.js section
  docker        # Docker section
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
#  battery       # Battery level and status
#  ruby          # Ruby section
#  vi_mode       # Vi-mode indicator
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
#  haskell       # Haskell Stack section
#  julia         # Julia section
#  aws           # Amazon Web Services section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
#  kubecontext   # Kubectl context section
#  terraform     # Terraform workspace section
#  hg            # Mercurial section (hg_branch  + hg_status)
#  exec_time     # Execution time
)

SPACESHIP_USER_COLOR="#FAE3B0"
SPACESHIP_HOST_COLOR="#F28FAD"
SPACESHIP_DIR_COLOR="#ABE9B3"
SPACESHIP_GIT_BRANCH_COLOR="#96CDFB"

SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_CHAR_SYMBOL="-> "
SPACESHIP_USER_PREFIX=" ."
SPACESHIP_DOCKER_PREFIX="using "
SPACESHIP_VENV_PREFIX="inside 🐍 "

# History configuration
export HISTFILE="/home/ashish/.local/share/zsh/history"
# The number of lines from $HISTFILE to read at the start of an interactive session
export HISTSIZE=10000
# The number of lines of your history you want saved
export SAVEHIST=10000
# Ensure that commands are added to the history immediately
setopt inc_append_history
# Skip command if duplicate of previous command
setopt hist_ignore_dups

# Shell configuration
export SHELL_CONFIG="/home/ashish/.config/shell"
source $SHELL_CONFIG/aliases.sh
source $SHELL_CONFIG/functions.sh

# Use fzf for searching through command line history.
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
wd() {
    source /usr/share/wd/wd.sh
}

# fnm setup
eval "$(fnm env --use-on-cd)"

# Dotfiles managaement stuff
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
