#!/bin/bash

#mysql installation and config
echo "--------------------------------------------"
echo "     mysql and phpmyadmin installation      "
echo "--------------------------------------------"

sudo apt install -y mysql-server
sudo mysql -u root -e "create user 'admin'@'localhost' identified by 'admin';"
sudo mysql -u root -e "grant all privileges on *.* to 'admin'@'localhost'; Flush privileges;"

APP_PASS="admin"
ROOT_PASS="admin"
APP_DB_PASS="admin"

echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $APP_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $APP_DB_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections

apt-get install -y phpmyadmin
