class docker::config {
  user {
    'vagrant':
      groups => docker;
  }
}
