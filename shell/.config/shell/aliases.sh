# Replacements and aliases for built-in programs
alias ls='exa --group-directories-first '
alias cat='bat '
alias traceroute='mtr '
alias vim='nvim '
alias cp='rsync --verbose --archive --compress --progress '
alias top='btm '

# Convenience aliases
alias ll='ls -lh'
alias la='ls -lah'
alias lsd='ls -d */'
alias l.='ls -lah | egrep "^\."'
alias free='free -m'
alias ping='ping -c 5'
alias wget='wget -c '

# Package Management
alias pacfind="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print $2}\")' | xargs -ro paru -S"
alias pacrem="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rns"
alias pacautorem='paru -Rns $(paru -Qdtq)'
alias pacclean='paru -Scc'
alias pacsort="paru -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | sort -h"

# System Resources 
alias camera='mpv --vf=hflip /dev/video0'

# Git aliases
alias gs='git status'
alias gl='git lg'

# Network
alias ip-nat='hostname -i'
alias ip-public='curl -4 ifconfig.co'

# Clipboard
alias cclip='xclip -selection clipboard'
alias cpaste='xclip -selection clipboard -o'

# Configuration Files
alias virc='vim ~/.dotfiles/zsh/.zshrc'
alias vial='vim ~/.dotfiles/shell/.config/shell/aliases.sh'
alias vinv='vim ~/.dotfiles/nvim/.config/nvim/init.vim'

# Fun Ztuff
alias rr='curl -s -L http://bit.ly/10hA8iC | bash'
alias yoink='sudo pacman -S '
alias yeet='sudo pacman -Rns '
