class docker::config {
  mount {
    '/sys/fs/cgroup':
      ensure  => mounted,
      device  => 'none',
      options => 'defaults',
      fstype  => 'cgroup';
  }
}
