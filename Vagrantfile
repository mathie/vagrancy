# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "ubuntu-13.10-server-amd64"

  config.vm.provision :shell do |shell|
    shell.path = 'bin/bootstrap.sh'
  end
end
