class puppet::repo($stage = first) {
  apt::repository {
    'puppet':
      url        => 'http://apt.puppetlabs.com/',
      components => [ 'main', 'dependencies' ],
      keyid      => '4BD6EC30';
  }
}
