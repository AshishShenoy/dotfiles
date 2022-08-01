# Allows other aliases to be sudo'ed
alias sudo='sudo '

# Replacements and aliases for built-in programs
alias ls='exa --group-directories-first '
alias cat='bat '
alias traceroute='mtr '
alias vim='neovide --multigrid '
alias cp='rsync --verbose --archive --compress --progress '
alias top='btm -r 2000'
alias wget='wget -c --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# Convenience aliases
alias ll='ls -lh'
alias la='ls -lah'
alias lsd='ls -d */'
alias l.='ls -lah | egrep "^\."'
alias tree='tree -C'
alias free='free -m'
alias ping='ping -c 5'
alias mkdir='mkdir -pv'
alias ra='ranger'
alias ..='cd ..'
alias ...='cd ../..'

# Package Management
alias pacfind="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print $2}\")' | xargs -ro paru -S"
alias pacrem="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rns"
alias pacautorem='paru -Rns $(paru -Qdtq)'
alias pacclean='paru -Scc'
alias pacaur='pacman -Qm'
alias pacsort="paru -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | sort -h"

# Dotfiles Management
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Aliases for BSD style CLIs
alias gs='git status'
alias gl='git lg'
alias dps='docker ps --format="table {{.ID}}\\t{{.Image}}\\t{{.Status}}\\t{{.Names}}"'

# Other
alias logout='kill -9 -1'
alias camera='mpv --vf=hflip /dev/video0'
alias cclip='xclip -selection clipboard'
alias cpaste='xclip -selection clipboard -o'
alias ip-public='curl -s -4 ifconfig.co'
alias pg='ping google.com'

# Configuration Files
alias virc='vim ~/.config/zsh/.zshrc'
alias vial='vim ~/.config/shell/aliases.sh'
alias viqt='vim ~/.config/qtile/config.py'

# Fun Ztuff
alias rr='curl -s -L http://bit.ly/10hA8iC | bash'
alias yoink='sudo pacman -S '
alias yeet='sudo pacman -Rns '
