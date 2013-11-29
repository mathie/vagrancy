class ruby::install {
  include ruby::repo

  package {
    [ 'ruby1.9.3', 'ruby-switch' ]:
      ensure => present;
  }

  exec {
    'ruby-switch-1.9':
      command => '/usr/bin/ruby-switch --set ruby1.9.1',
      unless  => '/usr/bin/ruby-switch --check | /bin/grep "^Currently using: ruby1.9.1"',
      require => Package['ruby-switch'];
  }
}
