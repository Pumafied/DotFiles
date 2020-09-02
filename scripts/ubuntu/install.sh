
#TODO:Move Document root to user/Documents/lampp

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install \
        vim \
        chromium-browser 
        filezilla \
        irssi \
        virtualbox \
        wireshark \
        gvim \
        blender \
        zsh \
        youtube-dl \
        emacs \
        gimp \
        htop \
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

# else do not 
cd ~/Downloads/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo dpkg -i ./google-chrome*.deb
sudo apt-get -f install

echo "Now finished with install script"
