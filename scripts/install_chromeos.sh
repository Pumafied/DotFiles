sudo apt-get update && sudo apt-get upgrade
sudo apt-get install wget git vim htop ruby python python3
#Ask for git token and set it
mkdir ~/code




#Generate a key and kick it back
ssh-keygen -t rsa
cat ~/.ssh/*.pub
sleep 10

#Set the Git Stuffs
git config --global user.email "austin@lubkerdesign.com"
git config --global user.name "Austin Lubker"


# Run the git downloader
./git_private.sh

# Run the linker
./link.sh

# run the ruby stuff
ruby update_bundles


