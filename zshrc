# Binary sources
export LANG=en_US.UTF-8
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=~/Desktop/Programming/hackermail:$PATH
export PATH=~/Desktop/Programming/funcat:$PATH
# GHC Compiler for Haksell
[ -f "/Users/joshuahahn/.ghcup/env" ] && source "/Users/joshuahahn/.ghcup/env"

# Setting ls colors in zsh
export CLICOLOR=1
export LSCOLORS=cxfxcxdxbxegedgxgxacad

# History configuration
HISTFILE=~/.zsh_history  # Default history file location
HISTSIZE=1000000000      # Number of commands stored in history
SAVEHIST=1000000000      # Number of commands to save to history file
setopt hist_ignore_all_dups

# Append to the history file instead of overwriting it
setopt APPEND_HISTORY
setopt SHARE_HISTORY     # Share history between sessions

# Setup autocompletion
autoload -Uz compinit
compinit

# Set background color
print -n "\e]11;#121212\a"

# Setting prompt text & color
function slproml {
    export PS1='%B[%F{117}hahn %F{177}%D{%H:%M} %F{216}%~%f]%b '
    PS2='> '
    PS4='+ '
}

#function slproml {
#    export PS1='%B%F{153}%* %F{183}[hahn:%~]%f%b$ '
#    PS2='> '
#    PS4='+ '
#}
slproml

# Starting up a new shell session displays the time (with cowsay)
#echo ("Hi Joshua!!!"
#date +"It's %A, %b %d, %Y!") | cowsay -n

echo -e "Hi Joshua!!\nIt's $(date '+%a %b %d %Y')" | cowsay
echo -e "\n"

cd ~/Desktop
