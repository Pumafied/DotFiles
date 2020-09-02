export ZSH=$HOME/DotFiles
#TODO: Make it check for nvim
#alias vim='nvim'
#alias vi='nvim'
alias lt='ls -tu'
alias wat='git diff master'
# Use this as uzi filename
alias uzi='tar -zxvf'



$(thefuck --alias)

# For server conections
alias lubker='ssh -i ~/.ssh/Asus.pem ubuntu@ec2-54-173-93-58.compute-1.amazonaws.com'
alias limo='ssh ubuntu@ec2-54-164-10-248.compute-1.amazonaws.com'
alias brad='ssh -i ~/.ssh/ownlend.pem ubuntu@ec2-18-216-159-202.us-east-2.compute.amazonaws.com'

# Stupid client shit
export ANDROID_HOME=/Development/android-sdk/
export PATH=${PATH}:/Development/android-sdk/platform-tools:/Development/android-sdk/tools

# for the goddamn git
alias thefuck='git diff master'

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

eval $(thefuck --alias)
