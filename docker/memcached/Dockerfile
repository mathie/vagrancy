# Memcached
#
# VERSION 1.0

MAINTAINER Graeme Mathieson, mathie@woss.name

# Stack with a minimal Ubuntu 13.10 base image
FROM stackbrew/ubuntu:saucy

# Make sure we're up to date
RUN apt-get update
RUN apt-get dist-upgrade -u -y

# Install memcached
RUN apt-get install -y memcached
