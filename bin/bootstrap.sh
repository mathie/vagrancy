#!/bin/bash -e

export DEBIAN_FRONTEND=noninteractive

add-apt-repository ppa:brightbox/ruby-ng-experimental

curl -s http://apt.puppetlabs.com/pubkey.gpg | apt-key add -
add-apt-repository 'deb http://apt.puppetlabs.com/ saucy main dependencies'

apt-get update -qq
apt-get dist-upgrade -qq -y
apt-get install -qq ruby1.9.3 puppet
