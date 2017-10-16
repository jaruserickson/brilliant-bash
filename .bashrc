### aliased sudo: so you can use custom aliases as sudo
alias sudo="sudo "

### weather: pass your city or zip code, and it returns the weather!
weather() { curl wttr.in/"$1"; }

### myip: prints out your IP address. Handy to check if your VPN is on!
alias myip="curl icanhazip.com"

### plz: re-run the last command as root.
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

### add some color to your ls.
### OLD PS1="\[\033[36m\]\u\[\033[m\]@\[\033[36m\]\h:\[\033[36;1m\]\W\[\033[m\⚡️ \]"

emojis=(🐶 🐭 🐹 🐰 🐸 🐨 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐠 🐳 🐬 🍕 🍟 🇨🇦 ⚡️ 〽️)
emoji='`echo ${emojis[$RANDOM % 21]}`'

###[ $TERM_PROGRAM == "Apple_Terminal" ]
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[36m\]\h:\[\033[36;1m\]\W\[\033[m\] $emoji  "
###export PS1="\[\033[30m\]\u\[\033[m\]@\[\033[90m\]\h:\[\033[90;1m\]\W\[\033[m\] $emoji  "

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


## my stuff


### cbase: change base of a number from base x to base y.
### convention: [ cbase z x y ] converts z from base x to base y.
function cbase() {
    echo "obase=$3;$(($2#$1))" | bc
}

### convert mp4s to web optimized gifs
function gif() {
    ffmpeg -i $1 -vf palettegen palette.png
    ffmpeg -i $1 -i palette.png -lavfi paletteuse -r 24 -s 256x144 $2
    rm palette.png
}

### ff: fast forward branch pull/push
function ff() {
    echo "Fast Forward v0.1"
    echo "<---------PULLING----------"
    git pull upstream $1
    echo ""
    echo "----------PUSHING--------->"
    git push origin $1
}

### react native stuff
alias native="react-native"
alias ios="react-native run-ios --simulator 'iPhone X'"
alias android="react-native run-android"

### python env stuff
alias leave="source deactivate"
alias py2="source activate py2"
alias py3="source activate py36"

### toronto
alias wttr="curl wttr.in/toronto"
alias tasks=top

### tasks: a command that makes sense for top
alias tasks=top

### bonk bonk
alias bonk="tput bel"
alias sbonk="say bonk"

