#!/bin/bash

#php installation and config
echo "--------------------------------------------"
echo "|             php installation             |"
echo "--------------------------------------------"

sudo apt-get -y install python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt install -y php7.0 php7.0-bcmath php7.0-mbstring php7.0-json php7.0-curl php7.0-gd php7.0-soap php7.0-mysql php7.0-xml php7.0-zip php7.0-opcache php7.0-mcrypt php7.0-xsl php7.0-xmlrpc 
sudo phpenmod bcmath ctype curl dom gd hash iconv json mbstring openssl pdo_mysql session PDO xml SimpleXML zip zlib

sudo sed -i 's/memory_limit = 128M/memory_limit = 512M/g'  /etc/php/7.0/apache2/php.ini
sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 9M/g'  /etc/php/7.0/apache2/php.ini

wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip
unzip ioncube_loaders_lin_x86-64.zip -d /home/vagrant/
echo "Ioncube Downloaded and unzipped"

sudo cp /home/vagrant/ioncube/ioncube_loader_lin_7.0.so /usr/lib/php/20151012/
ioncube="zend_extension = \"/usr/lib/php/20151012/ioncube_loader_lin_7.0.so\""
touch /home/vagrant/00-ioncube.ini
echo $ioncube >> /home/vagrant/00-ioncube.ini
sudo cp /home/vagrant/00-ioncube.ini /etc/php/7.0/apache2/conf.d/
sudo chown root:root /etc/php/7.0/apache2/conf.d/00-ioncube.ini
rm  /home/vagrant/00-ioncube.ini

echo "Ioncube Installed"

echo "--------------------------------------------"
echo "          php installation complete"
echo "--------------------------------------------"