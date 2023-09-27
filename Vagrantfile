# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "debian/buster64"
    
    config.vm.network "public_network", bridge: "Intel(R) Ethernet Connection (7) I219-V"
    config.vm.provision "shell", path: "install_samba.sh"
    config.vm.provision "file", source: "./smb.conf", destination: "/tmp/smb.conf"

    config.vm.provider "virtualbox" do |vb|
      vb.name = "Ma_VM_Samba"
      vb.memory = "2048"  # RAM en MB
    end
  end
  