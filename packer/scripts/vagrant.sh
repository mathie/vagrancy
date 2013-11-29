#!/bin/bash -x

echo '%vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

usermod -a -G sudo vagrant

mkdir ~vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O ~vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant ~vagrant/.ssh
chmod -R go-rwx ~vagrant/.ssh
