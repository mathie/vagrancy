class puppet::install {
  include puppet::repo

  package {
    'puppet':
      ensure => present;
  }
}
