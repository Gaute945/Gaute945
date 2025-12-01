pokemon-colorscripts -r
toilet -f term -F border --gay "Welcome $USER!"
maxfetch

# enable prompt with color support
autoload -U colors && colors
setopt prompt_subst
autoload -Uz promptinit
promptinit

# 󰣪󰢛

PROMPT='%F{#ff0000}%n%F{#ff6900}@%F{#ffa100}󰣪%F{#ffd100}󰢛%F{#ffff00}%m%f %~ %# '

alias tree='eza -T --icons --no-quotes --level=3 --git-ignore'
alias grep='grep --color=auto'
alias ls='eza -lhaBo --icons -a'
alias update='sudo pacman -Syu && yay -Syu'
alias steam='steam -no-cef-sandbox &'

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

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export VISUAL=nano
export EDITOR=nano

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/gaute/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
