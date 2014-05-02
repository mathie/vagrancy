# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "ubuntu-14.04-server-amd64"

  config.vm.network :forwarded_port, guest: 4243, host: 4243

  config.vm.provision :shell do |shell|
    shell.path = 'bin/bootstrap.sh'
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = 'site.pp'
    puppet.manifests_path = 'manifests'
    puppet.module_path    = 'modules'
    puppet.options        = [ '--parser', 'future' ]
  end
end
