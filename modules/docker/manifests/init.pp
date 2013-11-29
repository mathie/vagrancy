class docker {
  include docker::install, docker::config, docker::service

  anchor { 'docker::begin': } ->
    Class['docker::install'] ->
    Class['docker::config'] ~>
    Class['docker::service'] ->
    anchor { 'docker::end': }
}
