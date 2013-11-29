class docker::repo($stage = first) {
  apt::repository {
    'docker':
      url          => 'http://get.docker.io/ubuntu',
      distribution => 'docker',
      keyid        => 'A88D21E9';
  }
}
