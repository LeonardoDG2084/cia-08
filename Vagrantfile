# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
   config.vm.box = "ubuntu/focal64"
   config.vm.hostname = "iaac-station"
   config.vm.provision "shell", path: "iaac.sh", run: "always"
   config.vm.provider "virtualbox" do |v|
   v.cpus = 2
   v.memory = 4096
 end
end
