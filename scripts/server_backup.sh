#limo
rsync -av limo:/var/www ~/Documents/server_backup/limo
rsync -av limo:/var/log ~/Documents/server_backup/limo
rsync -av limo:/etc/apache2 ~/Documents/server_backup/limo
# lubker
rsync -av lubker:/var/www ~/Documents/server_backup/lubker
rsync -av lubker:/var/log ~/Documents/server_backup/lubker
rsync -av lubker:/etc/apache2 ~/Documents/server_backup/lubker

# Brad
rsync -av brad:/var/www ~/Documents/server_backup/brad
rsync -av brad:/var/log ~/Documents/server_backup/brad
rsync -av brad:/etc/apache2 ~/Documents/server_backup/brad

# 9monkey
rsync -av 9monkey:/var/www ~/Documents/server_backup/9monkey
rsync -av 9monkey:/var/log ~/Documents/server_backup/9monkey
rsync -av 9monkey:/etc/apache2 ~/Documents/server_backup/9monkey


