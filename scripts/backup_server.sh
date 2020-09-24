
# Make the folders
sudo mkdir postfix
sudo mkdir www
sudo mkdir apache
sudo mkdir log

# copy the folders
sudo cp -Ra /etc/postfix/* /home/ubuntu/postfix
sudo cp -Ra /etc/www /home/ubuntu/www
sudo cp -Ra /var/apache2/* /home/ubuntu/apache2
sudo cp -Ra /var/log/* /home/ubuntu/log

# Compress the folders.
# Pull the folders
# Clean up after ourselves



