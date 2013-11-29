class docker::install {
  include docker::repo

  package {
    'lxc-docker':
      ensure => present;
  }
}
