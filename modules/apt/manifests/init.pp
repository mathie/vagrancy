class apt {
  package {
    'software-properties-common':
      ensure => present;
  }

  exec {
    'apt-get-update':
      command     => '/usr/bin/apt-get update',
      refreshonly => true;
  }

  file {
    '/etc/apt/apt.conf.d/50minimalism':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/apt/50minimalism';
  }
}
