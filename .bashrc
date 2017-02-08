###############################################################################
#
# 88                       88  88  88  88
# 88                       ""  88  88  ""                             ,d
# 88                           88  88                                 88
# 88,dPPYba,   8b,dPPYba,  88  88  88  88  ,adPPYYba,  8b,dPPYba,   MM88MMM
# 88P'    "8a  88P'   "Y8  88  88  88  88  ""     `Y8  88P'   `"8a    88
# 88       d8  88          88  88  88  88  ,adPPPPP88  88       88    88
# 88b,   ,a8"  88          88  88  88  88  88,    ,88  88       88    88,
# 8Y"Ybbd8"'   88          88  88  88  88  `"8bbdP"Y8  88       88    "Y888
#
# A handful of bash aliases to strengthen the bond between you and your machine.
#
# All you can eat. Take whatever you want/need.
###############################################################################

### aliased sudo: so you can use custom aliases as sudo
###
### bash will normally stop recognizing aliases after it sees the
### space after the command sudo, but if it sees an alias that
### ends in a space, it will attempt to detect another alias after.
alias sudo="sudo "

### weather: pass your city or zip code, and it returns the weather!
### USAGE - weather cleveland
###         OR
###         weather 44106
### WARNING - city and zip code args may yield inaccurate/different results.
weather() { curl wttr.in/"$1"; }

### myip: prints out your IP address. Handy to check if your VPN is on!
alias myip="curl icanhazip.com"

### plz: re-run the last command as root.
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

### add some color to your ls.
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[36m\]\h:\[\033[36;1m\]\W\[\033[m\]\ 👉  "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls="ls -GFh"

### a more verbose, colorful ls: see almost everything!
alias lsm="ls -lAhG"

### up: cd .. when you're too lazy to use the spacebar
alias up="cd .."

### cls: a better clear with listed directories.
### DEPENDENCY - lsm (see above)
alias cls="clear;lsm"

### update: update all of your packages!
if [ ! -z "$(which pacman)" ]; then
    alias update="sudo pacman -Syyu"
elif [ ! -z "$(which apt)" ]; then
    alias update="sudo apt update && sudo apt upgrade"
elif [ ! -z "$(which apt-get)" ]; then
    alias update ="sudo apt-get update && sudo apt-get upgrade"
elif [ ! -z "$(which dnf)" ]; then
    alias update="sudo dnf upgrade"
elif [ ! -z "$(which yum)" ]; then
    alias update="su -c 'yum update'"
fi

### ports: lists all ports open and which programs are using them
### TIP - add ports to your NOPASSWD list.
alias ports="sudo netstat -tulpn"

### space: gets space left on disk
alias space="df -h"

### incognito: no saving your command history!
incognito() {
  case $1 in
    start)
    set +o history;;
    stop)
    set -o history;;
    *)
    echo -e "USAGE: incognito start - disable command history.
       incognito stop  - enable command history.";;
  esac
}

### gpom: simplistic git push origin master .
alias gpom="git push origin master"

### restart: a quick refresh for your shell instance.
alias restart="source ~/.bashrc"


##ME OWN GOODIES


### cbase: change base of a number from base x to base y.
### convention: [ cbase z x y ] converts z from base x to base y.
function cbase() {
    echo "obase=$3;$(($2#$1))" | bc
}

### tasks: a command that makes sense for top
alias tasks=top

### bonk bonk
alias bonk='say "bonk"'

alias wolf="ssh "
