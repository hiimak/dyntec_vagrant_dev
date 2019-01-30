#!/bin/bash

#Apache installation and config
echo "--------------------------------------------"
echo "|           apache2 installation           |"
echo "--------------------------------------------"
sudo apt update
sudo apt install -y apache2 
sudo a2enmod ssl rewrite php7.0
sudo cp /vagrant/apache/000-default.conf /etc/apache2/sites-available/
sudo a2ensite 000-default.conf
sudo service apache2 restart
echo "Apache installed and default site activated"