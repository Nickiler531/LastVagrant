# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_BASE = "ubuntu/xenial32"
NODES = 1

Vagrant.configure("2") do |config|
  config.vm.define "Master" do |subconfig|
    subconfig.vm.box= BOX_BASE
    subconfig.vm.provider :virtualbox do |vb|
      vb.customize [ "modifyvm", :id, "--name", "Master" ]
      vb.customize [ "modifyvm", :id, "--memory", "512" ]
      vb.customize [ "modifyvm", :id, "--cpus", "2" ]
      vb.customize [ "modifyvm", :id, "--cpuexecutioncap", "60" ]
    end
    subconfig.vm.network "private_network", ip: "10.11.12.3"
    subconfig.vm.provision "shell", path: "masterscript.sh" 
  end

  (1..NODES).each do |i|
    config.vm.define "Node#{i}" do |subconfig|
      subconfig.vm.box= BOX_BASE
      subconfig.vm.provider :virtualbox do |vb|
	vb.customize [ "modifyvm", :id, "--name", "Node#{i}" ]
	vb.customize [ "modifyvm", :id, "--memory", "512" ]
	vb.customize [ "modifyvm", :id, "--cpus", "1" ]
	vb.customize [ "modifyvm", :id, "--cpuexecutioncap", "60" ]
      end
      subconfig.vm.network "private_network", ip:"10.11.12.#{i+3}"
      subconfig.vm.provision "shell", path: "nodescript.sh"
      subconfig.vm.synced_folder "./htmlnodes/node#{i}", "/var/www/html"
    end
  end
end
