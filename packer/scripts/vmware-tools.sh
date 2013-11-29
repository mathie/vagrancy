#!/bin/bash -x

cd /tmp
mount -o loop,ro /home/vagrant/linux.iso /mnt
tar zxf /mnt/VMwareTools-*.tar.gz
umount /mnt
cd vmware-tools-distrib
./vmware-install.pl --default
cd ..
rm -rf vmware-tools-distrib /home/vagrant/linux.iso
