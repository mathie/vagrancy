class docker::config {
  user {
    'vagrant':
      groups => docker;
  }

  file {
    '/etc/default/docker':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('docker/etc-default-docker.sh.erb');
  }
}
