#!/usr/bin/env bash
# LAMP installation script
# Author: Saiful Islam
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y apache2
sudo ufw allow in "Apache Full"

#insttall mysql-server with password
NEW_PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password "$NEW_PASS
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password "$NEW_PASS
sudo apt-get -y install mysql-server
echo $NEW_PASS > mysql_cred.txt

# install php
sudo apt-get install -y php7.0-cli php7.0 php7.0-mysql php7.0-mbstring php7.0-curl php7.0-xml php7.0-zip
sudo service apache2 restart

# Creating test pages
sudo cat > /var/www/html/index.html << EOL
<html><body><h1>It works!</h1>
<p>This is the default web page for this server.</p>
<p>The web server software is running but no content has been added, yet.</p>
</body></html>
EOL
sudo echo '<?php phpinfo(); ?>' > /var/www/html/info.php
