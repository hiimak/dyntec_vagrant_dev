# Dyntec DVagrant Development enviroment

This Vagrant mashine creates the correct development enviroment for dyntec

  - ServerName: dyntec.local
  - phpmyadmin user:  admin
  - phpmyadmin pw:    admin
  - http://"your-ip"/phpmyadmin

# Requirements: 
 - Install Virtualbox, Vagrant and a SSH Client of your choice
 - Create an entry in your hosts file with dyntec.local  192.168....
 - Create an OpenSSH Keypair in your ~.ssh/ direcorty, name of the public-key must be id_rsa.pub
 

### Installation

1. Copy this Repo into an empty direcotry
2. Following changes have to be made in the Vagrantfile: 
    * Change the IP Address to one of your choice 
    * Change the dyntec-path to match the path on your host mashine 

```ruby
  config.vm.network "public_network" , ip: "192.168.178.68"
  
  host_folder = ["D:/dyntec/dyntec/var/www/dyntec/public_html"]
```

 3. If you want to open the terminal window of the VM change vb.gui = true  
 4. Change vb.memory = "" to allocate your your desired amount of RAM, same goes for vb.cpu =

```ruby
 config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     # Customize the amount of memory on the VM:
     vb.memory = "8024"
     # Customize the amount of CPUs on the VM:
     vb.cpus = 4
end
```

5. Open a terminal and cd into the Vagrantfile direcotry, and enter 

```sh
$ vagrant up
```