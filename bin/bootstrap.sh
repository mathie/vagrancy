#!/bin/bash -e

if [ -x /usr/bin/puppet ]; then
  if puppet --version | grep '^3' >/dev/null; then
    exit 0
  fi
fi

export DEBIAN_FRONTEND=noninteractive

add-apt-repository ppa:brightbox/ruby-ng-experimental

curl -s http://apt.puppetlabs.com/pubkey.gpg | apt-key add -
add-apt-repository 'deb http://apt.puppetlabs.com/ raring main dependencies'

apt-get update -qq
apt-get dist-upgrade -qq -y
apt-get install -qq ruby1.9.3 puppet
