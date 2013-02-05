export ZSH=$HOME/DotFiles

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
