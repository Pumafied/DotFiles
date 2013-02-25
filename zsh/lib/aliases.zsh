# reload zsh config
alias reload!='source ~/.zshrc'

alias eclimd= "sh ~/.eclipse/org.eclipse.platform_3.7.0_155965261/eclimd"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah --color=auto"
alias la="ls -AF --color=auto"
alias ll="ls -lFh --color=auto"

alias dual="sh ~/DotFiles/scripts/dualMonitor.sh"
alias one="sh ~/DotFiles/scripts/oneMonitor.sh"

#allows for easy editing of aliases
alias aliases="vim ~/DotFiles/zsh/lib/aliases.zsh"

#simply for convience
alias py="python"

alias rmf="rm -rf"

#shortcut to getan test
alias getan="cd ~/Documents/lampp/getan/test"

# shortcut to dotfiles
alias dot="cd ~/DotFiles"

#Shortcut to go to the AP workspace
alias ap="cd ~/Documents/APCOMPSCI"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# rake fix
alias rake="noglob rake"

#Commented out for lack of a mac
# Applications
#alias mou='open -a Mou.app'
#alias mark='open -a Marked.app'
#alias ios='open -a /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# be nice
alias please=sudo

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig getifaddr wlan0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# removed for lack of a mackkk
#alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

#Disabled for lack of mac
# Hide/show all desktop icons (useful when presenting)
#alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
#alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done
