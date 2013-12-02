class docker::install {
  include docker::repo

  package {
    'lxc-docker':
      ensure => present;

    # Manages the cgroup mountpoints in /sys/fs/cgroup.
    'cgroup-lite':
      ensure => present;
  }
}
