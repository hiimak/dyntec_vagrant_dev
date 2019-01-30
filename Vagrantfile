# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-18.04"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network" , ip: "192.168.178.68"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # Host folder is the one one your main machine
  host_folder = ["D:/dyntec/dyntec/var/www/dyntec/public_html"]
  guest_folder = ["/var/www/dyntec/public_html"]
  #config.vm.synced_folder host_folder, guest_folder

  # Change ID if you want to use multiple folders
  config.vm.synced_folder host_folder[0], guest_folder[0],  id: "dyntec",
  owner: "www-data",
  group: "www-data",
  mount_options: ["dmode=766","fmode=766"]

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     # Customize the amount of memory on the VM:
     vb.memory = "8024"
     # Customize the amount of CPUs on the VM:
     vb.cpus = 4
  end


  ssh_pub_key_path = "#{Dir.home}/.ssh/id_rsa.pub"
  ssh_pub_key = ""
  if File.file?(ssh_pub_key_path)
    ssh_pub_key = File.readlines(ssh_pub_key_path).first.strip
  else
    puts "No SSH key found. You will need to remedy this before pushing to the repository."
  end
  config.vm.provision :shell, :path => "bootstrap.sh", :args => [ssh_pub_key]
  config.vm.provision :shell, :path => "php_install.sh", :args => []
  config.vm.provision :shell, :path => "apache_install.sh", :args => []
  config.vm.provision :shell, :path => "mysql_install.sh", :args => []


end


