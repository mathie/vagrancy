# Memcached
#
# VERSION 1.0

# Stack with a minimal Ubuntu 14.04 base image. The FROM line must be provided
# as the first step, apparently.
FROM stackbrew/ubuntu:trusty

MAINTAINER Graeme Mathieson, mathie@woss.name

# Make sure we're up to date
RUN apt-get update
RUN apt-get dist-upgrade -u -y

# Install memcached
RUN apt-get install -y memcached

# Initial command is memcached, run as the daemon user
ENTRYPOINT ["memcached"]
USER daemon

# Expose the memcached port to the outside world
EXPOSE 11211
