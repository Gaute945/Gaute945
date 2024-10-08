#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Custom
pokemon-colorscripts -r
toilet -f term -F border --gay "Welcome $USER!"
maxfetch

alias tree='eza -T --icons --no-quotes --level=3 --git-ignore'
alias btop='sudo btop'
alias grep='grep --color=auto'
alias lsa='eza -l --icons'
alias ls='eza -lhaBo --icons -a'
alias update='sudo pacman -Syu && yay -Syu'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias l='/usr/bin/ls'
alias via='sudo chown $USER /dev/hidraw1' # fix for keyboard not showing up in via

### ARCHIVE EXTRACTION
# usage: ex <file>
ex() {
  if [ -f "$1" ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *.deb) ar x $1 ;;
    *.tar.xz) tar xf $1 ;;
    *.tar.zst) unzstd $1 ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoreboth
export PATH="/usr/lib/jvm/java-17-temurin/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

eval "$(thefuck --alias)"
