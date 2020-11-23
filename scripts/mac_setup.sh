/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install nvim htop nmap ruby git
sudo gem install bropages
# Pull dotfiles
git clone https://github.com/Pumafied/DotFiles.git

# Put are you me check

git config --global user.name "Austin Lubker"
git config --global user.email austin@lubkerdesign.com
#Set the key repeat
./link.sh
# Vim config
# Add vim wiki to the plugins
