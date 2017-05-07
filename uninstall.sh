# Remove PHP
sudo apt-get -y remove php.*
sudo apt-get -y autoremove
sudo apt-get -y autoclean
# Remove Apache2
sudo apt-get -y remove apache.*
sudo apt-get -y autoremove
sudo apt-get -y autoclean
# Remove MySQL
sudo apt-get -y remove  mysql.*
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/mysql
