# PostgreSQL
#
# VERSION 1.0

# Stack with a minimal Ubuntu 14.04 base image. The FROM line must be provided
# as the first step, apparently.
FROM stackbrew/ubuntu:trusty

MAINTAINER Graeme Mathieson, mathie@woss.name

# Set up a base locale -- otherwise, the installation of PostgreSQL will create
# a default main cluster without UTF-8 support.
RUN locale-gen --purge en_GB.UTF-8
RUN echo 'LANG=en_GB.UTF-8' > /etc/default/locale

# Make sure we're up to date
RUN apt-get update
RUN apt-get dist-upgrade -u -y

# Install PostgreSQL server
RUN apt-get install -y postgresql

# Initial command is to run PostgreSQL in the foreground as the postgres user.
ENTRYPOINT ["su", "-", "postgres", "-c", "/usr/lib/postgresql/9.1/bin/postgres -D /var/lib/postgresql/9.1/main -c config_file=/etc/postgresql/9.1/main/postgresql.conf"]

# Expose the memcached port to the outside world
EXPOSE 5432
