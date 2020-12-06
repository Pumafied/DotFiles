export ZSH=$HOME/DotFiles
export PYTHONPATH="/Users/pumafied/usdpython/USD/lib/python:$PYTHONPATH"
export PATH="/Users/pumafied/usdpython/USD:$PATH"
export PATH="/Users/pumafied/usdpython/usdzconvert:$PATH"

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

# Aliases for easy cd'ing
# Code
alias code="cd ~/Documents/code"
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

# Go to chromebook shared thing
alias shared='cd /mnt/chromeos/MyFiles/Downloads/'

# Create the env
alias create='virtualenv env && source env/bin/activate && pip3 -r requirements.txt'

# source the env
alias env='source env/bin/activate'

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
# this is the second the fuck
#eval $(thefuck --alias)
