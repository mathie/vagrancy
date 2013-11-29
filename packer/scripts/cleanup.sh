#!/bin/bash -x

apt-get clean

rm -f /var/lib/dhcp/*
rm -rf /etc/udev/rules.d/70-persistent-net.rules /dev/.udev/ /lib/udev/rules.d/75-persistent-net-generator.rules

service rsyslog stop
rm /var/log/dmesg.*
for i in $(find /var/log -type f); do
  cat < /dev/null > $i
done

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
