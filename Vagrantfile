# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443

  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
   end
  
  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "imcmysql" => ["default"],
      "imcapp" => ["default"]
    }
    ansible.playbook = "provisioning/imcprep.yml"
  end

  #config.vm.synced_folder
end
