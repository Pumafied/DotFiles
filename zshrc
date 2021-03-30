export ZSH=$HOME/DotFiles
export PYTHONPATH="/Users/pumafied/usdpython/USD/lib/python:$PYTHONPATH"
export PATH="/Users/pumafied/usdpython/USD:$PATH"
export PATH="/Users/pumafied/usdpython/usdzconvert:$PATH"

#Easy Password generator
alias pass="curl https://www.dinopass.com/password/simple"

# Ping Monitors
alias plubker="gping lubkerdesign.com"
alias p9monkey="gping 10menroofing.com"
alias plimo="gping omahametrolimo.com"
alias pbrad="gping ownlend.com"
#2 is arcadia
alias arcadia="ssh pumafied@192.168.0.2"
#3 is pro
alias book="ssh pumafied@192.168.0.3"
#4 is imac
alias imac="ssh pumafied@192.168.0.4"
#
alias takemehome="ssh -D 1234 pumafied@97.119.215.210"
#
#alias tunnel="ssh pumafied@j"
#
#Get your own public ip
alias ip="curl ifconfig.co/"
alias ip4="curl -4 ifconfig.co/"
alias ip6="curl -6 ifconfig.co/"


#Add a custom speed test here
#brew tap teamookla/speedtest
#brew update
#brew install speedtest --force

# Tail monitors

# Curl update monitors
#


#TODO: Make it check for nvim
#alias vim='launchvim()'
#alias vi='launchvim()'
#launchvim() {
#	if !command -v nvim &> /dev/null
#	then
#			/usr/bin/vim
#	else
#			/user/bin/nvim
#	fi
#}
# Add the curl checks
# Make the util nice
#TODO:  create web stuff by default

# Stealth (slowest) TCP/UDP scan of 192.168.1.0/24 for first 1024 ports
#nmap -sT -sU -T5 192.168.1.0/24 -p 1-1024

# Find all open ports fir an ip Stealth
# Find all open ports for an ip non-stealth
#


# Alias to scan the local network may need to be modified depending on you subnet settings
#ifconfig nmap -sP 192.168.0.0/24


# Aliases for easy cd'ing
# Code
# TODO: Take hostname and go to right dir
alias "'cd code'=~/Documents/code_book"
alias code="cd ~/Documents/code_book"
# Docs
alias docs="cd ~/Documents"
# Download
alias down="cd ~/Downloads"


alias lt='ls -tu'
alias wat='git diff master'

# Use this as uzi filename
alias uzi='tar -zxvf'
alias heic="magick mogrify -monitor -format jpg *.HEIC ; rm *.HEIC"

alias update='sudo apt-get update && sudo apt-get upgrade'
alias mac_update='brew update && brew upgrade'

# Mac system update and app store update
alias mac_system='sudo softwareupdate -ia'
alias app_update='sudo softwareupdate -ia --verbose'

# Go to chromebook shared thing
alias shared='cd /mnt/chromeos/MyFiles/Downloads/'

# Create the env
alias create='virtualenv env && source env/bin/activate && pip3 -r requirements.txt'

# source the env
alias env='source env/bin/activate'


#wipes and recreates
alias force='rm -rf env/ && virtualenv env && source env/bin/activate && pip3 -r requirements.txt'

# Check the status of the servers
# Eventually i'd like it if once a ping is reciveved then it would switch to curl to check for apache
alias checkl='ping lubkerdesign.com'
alias checko='ping ownlend.com'
alias checkm='ping omahametrolimo.com'
# Change this when the domain is moved over
alias check10='ping 10menroofing.com'

# ------ For Server Conections ---
# Add title to the window
# Mosh
alias lubker="mosh --ssh='ssh -i ~/.ssh/Asus.pem' ubuntu@ec2-54-173-93-58.compute-1.amazonaws.com"
alias limo='mosh ubuntu@ec2-54-164-10-248.compute-1.amazonaws.com'
alias brad="mosh --ssh='ssh -i ~/.ssh/ownlend.pem' ubuntu@ec2-18-216-159-202.us-east-2.compute.amazonaws.com"
alias 9monkey='mosh ubuntu@3.135.201.130'

# SSH
alias lubkerssh='ssh -i ~/.ssh/Asus.pem ubuntu@ec2-54-173-93-58.compute-1.amazonaws.com'
alias limossh='ssh ubuntu@ec2-54-164-10-248.compute-1.amazonaws.com'
alias bradssh='ssh -i ~/.ssh/ownlend.pem ubuntu@ec2-18-216-159-202.us-east-2.compute.amazonaws.com'
alias 9monkeyssh='ssh ubuntu@3.135.201.130'
# ------ End Server Connections -------

# Stupid client shit
export ANDROID_HOME=/Development/android-sdk/
export PATH=${PATH}:/Development/android-sdk/platform-tools:/Development/android-sdk/tools

# for the goddamn git - changed to not conflict with the fuck
alias whateven='git diff master'

# define the code directory
if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
fi

# load all zsh config files
for config ($ZSH/**/*.zsh) source $config

# initialize autocomplete
autoload -U compinit
compinit

for config ($ZSH/**/completion.sh) source $config

export EDITOR='vim'

export PATH=/usr/local/bin:$PATH

# load rvm
if [[ -d ~/.rvm ]]; then
    source ~/.rvm/scripts/rvm
fi

# add /usr/local/sbin
if [[ -d /usr/local/sbin ]]; then
    export PATH=/usr/local/sbin:$PATH
fi

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

# See if this will even work
#$(thefuck --alias)

#php shit for tranquilityeditor
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
