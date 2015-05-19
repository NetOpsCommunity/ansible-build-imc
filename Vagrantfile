# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-6.6"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
   end
  
  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "imcmysql" => ["default"],
      "imcapp" => ["default"]
    }
    ansible.playbook = "provisioning/imcinstall.yml"
  end
end
