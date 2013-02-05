#!/bin/bash
#Script exports all files to the local computer
dir=~/DotFiles/
#Add the .zshrc

# Where the repo is stored
#This is not ready to be used yet
#except = "scripts"    
#copy the selected folders and files into a specified folder
#pulls in the available files
# eventually this script should be dynamic and check the current folder but for now this will work
#these are the specified dot files that you want
#file="gconf conkyrc vimrc vim git/gitconfig"

#cd  $dir
#OUTPUT=$(ls -1)
#echo $OUTPUT

#If it is a folder then it needs to be dumped in the home and then its folder neews to be removed and then mv can be used to rename it to its name plus a dot
#cp -a ~/DotFiles/config/  ~/.config/awesome/

#Awesome config
cp -a ~/DotFiles/config/awesome  ~/.config


#vimrc
cp -a ~/DotFiles/vimrc  ~/
rm  ~/.vimrc
cp ~/vimrc ~/.vimrc


#Gconf
cp -a ~/DotFiles/gconf  ~/

rm -rf ~/.gconf

mv ~/gconf ~/.gconf



#bashrc
#rm -rf ~/.bashrc
#mv ~/bashrc ~/.bashrc


cp -a ~/DotFiles/conkyrc  ~/
rm ~/.conkyrc
mv ~/.conkyrc


cp -a ~/DotFiles/vim  ~/
rm -rf ~/.vim
mv ~/vim ~/.vim

cp -a .zshrc ~/
#------------Not Dot Section-------------
#/etc/ssh
#
#SSH 
#cp ~/$dir /etc/ssh/sshd_config 



#crontab /$dir/crontab 

#FTP

#Apache

#Motion
#sudo cp  $dir/motion.conf /etc/motion/motion.conf
#SSH config

#for file in $file; do
#        echo "Exports repos dot files"

#        cp $dir/$file ~/.$file
#done
