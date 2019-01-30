#!/bin/bash
apt-get update && apt-get -y dist-upgrade
echo "Update and Upgrade successful"
apt-get install -y git
#git clone https://github.com/teddysun/lamp.git /home/vagrant/lamp
echo "Git Installed and Lamp cloned"

echo "SSH key provisioning."

directory=/home/vagrant/.ssh/
file=/home/vagrant/.ssh/authorized_keys

if [ ! -e $directory ]; then
    mkdir -p /home/vagrant/.ssh/
    echo ".ssh/ Directory created"
fi 

if [ ! -e $file ]; then
    touch /home/vagrant/.ssh/authorized_keys
    echo ".ssh/authorized_keys created"
else 
    echo $1 >> /home/vagrant/.ssh/authorized_keys
fi 

chmod 644 /home/vagrant/.ssh/authorized_keys
echo "SSH key provisioning successfull"

sudo sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/g' /etc/ssh/sshd_config
sudo sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config

chown -R vagrant /home/vagrant/.ssh
sudo systemctl restart ssh
sudo apt-get install --reinstall bash-completion
sudo apt install zip unzip -y
exit 0