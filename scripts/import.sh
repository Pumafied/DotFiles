#!/bin/bash
#Add zshrc
#Where the repo is stored
dir=~/DotFiles  
# list of files/folders to backup
file="gconf conkyrc vimrc vim xinit" 

#bashrc
cp -a .bashrc $dir/bashrc

#git config

cp -a .gitconfig $dir/git/gitconfig

#zshrc
cp -a .zshrc $dir/zshrc

#cron 
crontab -l > $dir/crontab

#SSH
cp /etc/ssh/sshd_config $dir/ssh

#FTP

#Apache

#Motion
sudo cp  /etc/motion/motion.conf $dir/motion.conf
#awesome
cp -a ~/.config/awesome/ ~/DotFiles/config/

for file in $file; do
	echo "Importing specified files"
    
	cp -a ~/.$file $dir/$file
done
