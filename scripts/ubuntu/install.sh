
#echo "Are you sure that you want to replace the dotfiles on the system with your own?"
#TODO:Move Document root to user/Documents/lampp

#echo "Now begining install script"
#while true; do
#    read -p "Do you wish to import the dotfiles to your computer?" yn
#    case $yn in
#        [Yy]* ) sh export.sh; break;;
#        [Nn]* ) break;;
#        * ) echo "Please answer y or n.";;
#    esac

sudo apt-get remove unity-lens-shopping
sudo add-apt-repository ppa:team-xbmc
sudo apt-get update
sudo apt-get install xbmc
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install \
        vim \
        chromium-browser 
        skype \
        filezilla \
        irssi \
        virtualbox \
        wireshark \
        gvim \
        blender \
        zsh \
        youtube-dl \
        playonlinux \
        emacs \
        gimp \
        wine \
        winetricks \
        htop \
        eclipse \
        synaptic \
        unetbootin \
        xclip \
        acidrip \
        dosemu \
        mrtg \
        awesome \
        wireless-tools \
        conky-all \
        kismet

apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list 
apt-get -y update 
apt-get -y install mongodb-10gen 


cd ~/Downloads/
wget http://www.apachefriends.org/download.php?xampp-linux-1.7.3a.tar.gz
sudo tar xvfz xampp-linux-1.7.3a.tar.gz -C /opt
/opt/lampp/lampp start



#while true; do
#    read -p "Check localhost and see whether the  test page is displayed correctly. Then come back and say whether it was or not" yn
#    case $yn in
#        [Yy]* ) break;; #Config document root
#       [Nn]* ) break;; #Just continue with the rest of the script
#        * ) echo "Please answer y or n.";;
#    esac
if [$continue == 1]
    then
            #Config Document root 

# else do not 
cd ~/Downloads/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo dpkg -i ./google-chrome*.deb
sudo apt-get -f install

echo "Now finished with install script"
