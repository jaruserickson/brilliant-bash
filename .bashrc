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

### weather: pass your city or zip code, and it returns the weather!
### Usage: weather cleveland
###              OR
###         weather 44106
weather() { curl wttr.in/"$1"; }

### myip: prints out your IP address. Handy to check if your VPN is on!
alias myip="curl icanhazip.com"

### plz: re-run the last command as root.
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

### ls but better: add some color to your life.
alias ls='ls --color=auto'
alias lsm='ls -lAhG --color=auto'

### a better clear
alias cls='clear;lsm'

### update: update all of your packages!
if [ uname -a | grep -i darwin == "darwin" ]; then
  alias update="homebrew update; homebrew upgrade --all; brew cleanup -s"
elif [ cat /proc/version | grep -i  == "arch" ]; then
  alias update="sudo pacman -Syyu"
else
  echo "I have no clue what OS you're using..."
fi
